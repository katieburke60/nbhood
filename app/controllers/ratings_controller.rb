class RatingsController < ApplicationController
  def new
    @rating = Rating.find_by(id: params[:id])
    if !@rating
      @rating = Rating.new
    end
  end

  def create
    @rating = Rating.find_by(id: params[:id])
    if @rating.update(ratings_params)
      @rating.complete = true
      @rating.save
      redirect_to member_path(current_member)
    else
      render '/ratings/new'
      flash[:alert] = "Please select a rating"
    end
  end

  private
  def ratings_params
    params.require(:ratings).permit(:rating, :comment)
  end


end
