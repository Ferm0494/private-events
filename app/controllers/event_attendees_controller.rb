class EventAttendeesController < ApplicationController
  before_action :authenticate ,:set_up_inputs
  def set_up_inputs
    @event = Event.find(params[:event_id])
    @user = current_user
  end
  def create
    @event_attend = EventAttendee.new
    @event_attend.attendee_event = @event
    @event_attend.event_attendee = @user
    @event_attend.save 
    redirect_to event_path(@event.id)
  end

  def destroy
   EventAttendee.find_by(event_attendee_id: @user.id).destroy
   redirect_to event_path(@event.id)

  end
end
