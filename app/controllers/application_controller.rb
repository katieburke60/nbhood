class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_member, :is_logged_in?, :current_business, :business_logged_in?

    def current_member
      current_member ||= Account.find_by_id(session[:account_id]).member
    end

     def is_logged_in?
       current_member != nil
     end

     def current_business
       #binding.pry
       current_business ||= BusinessAccount.find_by_id(session[:business_account_id]).business
     end

     def business_logged_in?
       current_business != nil
     end
  end
