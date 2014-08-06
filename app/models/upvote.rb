class Upvote < ActiveRecord::Base
  validates :post_id, :user_id, presence: true

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :upvotes
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :upvotes
  )
end
