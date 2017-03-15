class RootController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  skip_before_action :redirect_to_create_profile
  def index
    if is_logged_in? || business_logged_in?
      redirect_to events_path
    end
  end
end
