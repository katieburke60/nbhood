class BusinessAccountsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  skip_before_action :redirect_to_create_profile
  skip_before_filter :verify_authenticity_token

  def new
    @business_account = BusinessAccount.new
  end

  def create
    @business_account = BusinessAccount.new(registration_params)
    if !@business_account.save
      render 'root/index'
    else
      session[:business_account_id] = @business_account.id
      redirect_to new_business_path
    end
  end

  private

  def registration_params
    params.permit(:email, :password, :password_confirmation)
  end

end
