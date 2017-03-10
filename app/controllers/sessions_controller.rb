class SessionsController < ApplicationController

  def create
    account = Account.find_by(email: params[:email])
    if account
      member=account.member
    else
      redirect_to "/" alert: "Information invalid" and return
    end
    if member.authenticate(params[:password])
      session[:account_id] = member.account_id
      redirect_to member_path(member.id)
    else
      render "root/index", alert: "Information invalid" and return
    end
  end
end
