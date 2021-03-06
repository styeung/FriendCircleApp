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

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :poster_id,
    primary_key: :id,
    inverse_of: :poster
  )

  has_many(
    :upvotes,
    class_name: "Upvote",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :user
  )

  has_many(
    :own_comments,
    class_name: "Comment",
    foreign_key: :commenter_id,
    primary_key: :id,
    inverse_of: :commenter
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

  def set_forgot_token!
    self.forgot_token = self.class.generate_token
    self.save!

    self.forgot_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end
end
