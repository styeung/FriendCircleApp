class CommentsController < ApplicationController
  def create
    @comment = current_user.own_comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to feed_url
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to feed_url
    end
  end

  def destroy

  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
