module MembersHelper
  def member_rsvps_heading
    if @member.rsvps.count > 0
      if @member == current_member
        "Your Events:"
      else
        "#{@member.name}'s events"
      end
    else
      "No Upcoming Events"
    end
  end

  # def member_rsvp_links
  #   if @member != current_member && rsvp.event.members.include?(@member)
  #     link_to "Cancel", cancel_rsvp_path(rsvp.event, rsvp)
  #   elsif @member != current_member
  #     "Or to RSVP: "
  #     link_to "RSVP", rsvp_path(rsvp.event)
  #   elsif @member == current_member
  #     "If you would like to cancel: "
  #     link_to "Cancel", cancel_rsvp_path(rsvp.event, rsvp)
  #   end
  # end

end
