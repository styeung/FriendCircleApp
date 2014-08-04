class PostShare < ActiveRecord::Base
  validates :circle, :post, presence: true

  belongs_to :circle, inverse_of: :post_shares

  belongs_to :post, inverse_of: :post_shares
end
