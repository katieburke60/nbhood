class SessionsController < ApplicationController

  def create
    account = Account.find_by(email: params[:email])
    if account && account.authenticate(params[:password])
      member=account.member
      session[:account_id] = member.account_id
      redirect_to member_path(member.id)
    else
      flash[:alert] = "Information invalid"
      redirect_to "/"
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
