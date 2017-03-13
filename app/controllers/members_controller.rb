class MembersController < ApplicationController

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
      @member.account_id = session[:account_id]
      if !@member.save
        render '/members/new'
      end
    end
    redirect_to @member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update!(member_params)
      render 'members/edit'
    else
      redirect_to @member
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :about, :age, :hometown, :gender, :relationship_status, :phone)
  end

end
