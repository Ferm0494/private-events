class EventsController < ApplicationController
  before_action :authenticate, only: %i[create new]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(sanitize_params_event)
    if @event.save
      flash[:notice] = 'Event created succesfully'
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @events = Event.paginate(page: params[:page], per_page: 15)
  end

  def show
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = ' Invalid path'
    redirect_to events_path
  end

  def sanitize_params_event
    params.require(:event).permit(:title, :location, :description, :date)
  end
end
