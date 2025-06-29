class AttendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attend.new(user: current_user, event: @event)

    if @attendance.save
      redirect_to events_path, notice: "You are now attending this event."
    else
      redirect_to events_path, alert: "Could not attend the event."
    end
  end

  def destroy
    @attendance = Attend.find_by(user: current_user, event_id: params[:event_id])
    @attendance.destroy if @attendance
    redirect_to events_path, notice: "You are no longer attending this event."
  end
end
