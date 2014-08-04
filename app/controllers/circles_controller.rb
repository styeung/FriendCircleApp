class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    render :new
  end

  def create
    @circle = current_user.owned_circles.new(circle_params)

    if @circle.save
      redirect_to circle_url(@circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def show
    @circle = current_user.owned_circles.find(params[:id])
    render :show
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :friend_ids => [])
  end
end
