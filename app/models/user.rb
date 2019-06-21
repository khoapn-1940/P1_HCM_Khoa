class User < ApplicationRecord
  enum role: {guess: 0, user: 1, admin: 2}
  validates :name,  presence: true,
   length: {maximum: Settings.name_maximum_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
   length: {maximum: Settings.email_maximum_length},
   format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  VALID_PHONE_REGEX = /\A[+-]?\d+\z/i
  validates :phone, presence: true,
   length:
  {
    minimum: Settings.phone_minimum_length,
    maximum: Settings.phone_maximum_length
  },
   format: {with: VALID_PHONE_REGEX}
  VALID_BANK_ACCOUNT_REGEX = /\A[+-]?\d+\z/i
  validates :bank_account, presence: true,
   length:
  {
    minimum: Settings.bank_account_minimum_length,
    maximum: Settings.bank_account_maximum_length
  },
   format: {with: VALID_BANK_ACCOUNT_REGEX}
  has_secure_password
  validates :password, presence: true,
   length: {minimum: Settings.password_minimum_length}, on: :create

  attr_accessor :remember_token

  def self.digest string
    if ActiveModel::SecurePassword.min_cost
      cost = BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def downcase_email
    email.downcase!
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated? remember_digest, token
    # send("#{attribute}_digest")
    return false unless remember_digest
    BCrypt::Password.new(remember_digest).is_password?(token)
  end
end
