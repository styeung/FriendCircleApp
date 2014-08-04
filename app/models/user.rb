class User < ActiveRecord::Base
  has_many(
    :owned_circles,
    class_name: "Circle",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :owner
  )

  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    foreign_key: :member_id,
    primary_key: :id,
    inverse_of: :member
  )

  has_many(
    :member_circles,
    through: :circle_memberships,
    source: :circle,
    inverse_of: :friends
  )

  validates :email, :password_digest, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_validation :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_token
    self.save!

    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end
end
