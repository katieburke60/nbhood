class MembersController < ApplicationController
  skip_before_action :redirect_to_create_profile, only: [:new, :create]

  def index
      @search = params[:search]
    if @search
      @members = Member.where("lower(name) LIKE ?", "%#{@search.downcase}%")
    else
      @members = Member.all
    end
  end

  def new
    @member = Member.find_by(account_id: session[:account_id])
    if @member
      redirect_to edit_member_path(@member)
    else
      @member = Member.new
    end
  end


  def show
    @member = Member.find_by(id: params[:id]) #in case looking at someone else's profile
  end

  def create
    @member = Member.find_by(account_id: session[:account_id])
    if !@member
      @member = Member.new(member_params)
      neighborhood = Neighborhood.find_by(name: params[:neighborhood])
      @member.neighborhood = neighborhood
      @member.account_id = session[:account_id]
      if !@member.save
        render '/members/new'
      else
      redirect_to @member
      end
    else
      redirect_to @member
    end


  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    neighborhood = Neighborhood.find_by(id: params[:neighborhood].to_i)
    @member.neighborhood_id = neighborhood.id
    if !@member.update(member_params)
      render 'members/edit'
    else
      redirect_to @member
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :about, :age, :hometown_state, :gender, :relationship_status, :phone)
  end

end
