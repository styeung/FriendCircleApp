class Post < ActiveRecord::Base
  validates :body, :poster, :shared_circles, presence: true

  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :poster_id,
    primary_key: :id,
    inverse_of: :posts
  )

  has_many :links, inverse_of: :post

  has_many :post_shares, inverse_of: :post

  has_many(
    :shared_circles,
    through: :post_shares,
    source: :circle,
    inverse_of: :shared_posts
  )

  has_many(
    :upvotes,
    class_name: "Upvote",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )

  has_many(
    :post_comments,
    class_name: "Comment",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )
end
