class User < ActiveRecord::Base
    has_secure_password
  before_save {|user| user.email=user.email.downcase}
  before_save :create_session_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
private
  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
    
    
    
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
    
    def self.search(search)
      if search
        where("name LIKE ?", "%#{search}%")
      else
        all
      end
    end
end
