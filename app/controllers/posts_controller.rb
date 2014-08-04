class PostsController < ApplicationController
  before_action :require_signed_in

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.links.new(link_params)

    if @post.save
      redirect_to home_url
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, shared_circle_ids: [])
  end

  def link_params
    params.permit(:links => [:title, :url])
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end
end
