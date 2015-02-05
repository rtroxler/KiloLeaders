class User < ActiveRecord::Base
  has_many :lifts, dependent: :destroy

  # PR Board lifts
  store_accessor :prboard, :snatch
  store_accessor :prboard, :cnj

  #need to set up validations for all of these

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }
  #Need to have conditional validation on this
  #validates :password, length: { minimum: 4 }

  has_secure_password

  def feed
    Lift.where("user_id = ?", id)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
