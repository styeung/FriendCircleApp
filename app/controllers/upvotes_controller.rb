class UpvotesController < ApplicationController
  def create

    # @upvote = Upvote.new
#     @upvote.user_id = current_user.id
#     @upvote.post_id = params[:post_id]

    @upvote = current_user.upvotes.new(post_id: params[:post_id])

    if @upvote.save
      redirect_to feed_url
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])

    if @upvote.destroy
      redirect_to feed_url
    end
  end

end
