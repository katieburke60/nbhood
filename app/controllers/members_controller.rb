class MembersController < ApplicationController

  def index
      @search = params[:search]
    if @search
      @members = Member.where("lower(name) LIKE ?", "%#{@search.downcase}%")
    else
      @members = Member.all
    end
  end
  #
  # def show
  #   @member = Member.find_by(name: params[:name])
  # end



end
