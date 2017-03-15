class RatingsController < ApplicationController


  def new
    @rating = Rating.find_by(id: params[:id])
    if !@rating
      @rating = Rating.new
    end
  end

  def create
byebug
  end


end
