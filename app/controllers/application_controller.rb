class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_member, :is_logged_in?

    def current_member
      current_member ||= Account.find_by_id(session[:account_id]).member
    end

     def is_logged_in?
       current_member != nil
     end

end
