class Circle < ActiveRecord::Base
  validates :name, :owner, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :owned_circles
  )

  has_many :circle_memberships, inverse_of: :circle
  has_many(
    :friends,
    through: :circle_memberships,
    source: :member,
    inverse_of: :member_circles
  )
end
