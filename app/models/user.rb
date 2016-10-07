class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Must be 6 chars"}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_reader :password

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  # def is_password?(pw)
  #   self.password_digest == BCrypt::Password.create(pw)
  # end

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(pw)
    nil
  end


end
