class Comment < ActiveRecord::Base
  validates :body, :commenter, :post, presence: true

  belongs_to(
    :commenter,
    class_name: "User",
    foreign_key: :commenter_id,
    primary_key: :id,
    inverse_of: :own_comments
  )

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post_comments
  )
end
