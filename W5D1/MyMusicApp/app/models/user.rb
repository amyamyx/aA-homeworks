# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password


  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    return nil if @user.nil?

    @user.valid_password?(password) ? @user : nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(input_password)
    @password = input_password
    self.password_digest = BCrypt::Password.create(input_password)
  end

  def valid_password?(input_password)
    BCrypt::Password.new(self.password_digest).is_password?(input_password)
  end
end
