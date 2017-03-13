class BusinessSessionsController < ApplicationController

  def create
    session.clear
    business_account = BusinessAccount.find_by(email: params[:email])
    if business_account && business_account.authenticate(params[:password])
      business = business_account.business
      binding.pry
      session[:business_account_id] = business.business_account_id
      redirect_to business_path(business.id)
    else
      flash[:alert] = "Information invalid"
      redirect_to new_business_account_path
    end
  end
end
