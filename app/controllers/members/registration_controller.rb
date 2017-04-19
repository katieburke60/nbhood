class RegistrationController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  skip_before_action :redirect_to_create_profile

  def create
    @account = Account.new(registration_params)
    if !@account.save
      render 'root/index'
    else
      session[:account_id] = @account.id
      redirect_to new_member_path
    end
  end


  private

  def registration_params
    params.permit(:email, :password, :password_confirmation)
  end

end
