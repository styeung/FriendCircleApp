class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    render :new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.owner_id = current_user.id

    if @circle.save
      redirect_to circle_url(@circle)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :friend_ids => [])
  end
end
