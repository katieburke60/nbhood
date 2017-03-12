class BusinessSessionsController < ApplicationController

  def create
    business_account = BusinessAccount.find_by(email: params[:email])
    if business_account && business_account.authenticate(params[:password])
      business = business_account.business
      session[:business_account_id] = business.business_account_id
      redirect_to business_path(business.id)
    else
      flash[:alert] = "Information invalid"
      redirect_to "/"
    end
  end
end
