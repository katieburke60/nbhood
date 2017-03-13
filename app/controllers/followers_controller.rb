class FollowersController < ApplicationController
  def create
    business = Business.find_by(id: params[:id])
    current_member.businesses << business
    flash[:message] = "You are now following #{business.name}"
    redirect_to business_path(business)
  end

  def destroy
    business = Business.find_by(id: params[:id])
    follow = MembersFollowBusiness.find_by(member_id: current_member.id, business_id: business.id)
    follow.destroy
    flash[:message] = "You are no longer following #{business.name}"
    redirect_to business_path(business)
  end
end
