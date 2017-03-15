class RatingsController < ApplicationController
  def new
    @rating = Rating.find_by(id: params[:id])
  end

  def create

  end


end
