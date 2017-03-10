class MembersController < ApplicationController

  def new
    @member = Member.find_by(account_id: session[:account_id])
    if @member
      redirect_to edit_member_path
    else
      @session = session
      @member = Member.new
    end
  end
end
