class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :key_locations
  
  before_save {|user| user.email=user.email.downcase}
  before_create :create_session_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
    
  def User.new_session_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
    def create_session_token
      self.session_token = User.digest(User.new_session_token)
    end
    
    def self.search(search)
      if search
        where("name LIKE ?", "%#{search}%")
      else
        all
      end
    end
end