class BusinessAccountsController < ApplicationController


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
    params.require(:business_account).permit(:email, :password, :password_confirmation)
  end

end
