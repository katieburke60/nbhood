class RegistrationController < ApplicationController


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
