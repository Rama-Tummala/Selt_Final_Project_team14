class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :key_locations
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_save {|user| user.email=user.email.downcase}
  before_save :create_session_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
    
  def change
    create_table :users, force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.string   "session_token"
      t.string   "password_digest"
      t.string   "home_city"
      t.string   "recommended_places"
      t.string   "places_visited"
      t.string   "following"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      end
  end
  
  #follow a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  #unfollow a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  #returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
  
  
  private
    def create_session_token
      self.session_token = SecureRandom.urlsafe_base64
    end
    
    def self.search(search)
      if search
        where("name LIKE ?", "%#{search}%")
      else
        all
      end
    end
end