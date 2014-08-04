class CircleMembership < ActiveRecord::Base
  validates :circle_id, :member_id, presence: true

  belongs_to :circle, inverse_of: :circle_memberships
  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :member_id,
    primary_key: :id,
    inverse_of: :circle_memberships
  )
end
