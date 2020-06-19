class EventsController < ApplicationController
  before_action :authenticate, only: [:create,:new]

  def new
    @event = Event.new
  end

  def create
    
    @event = Event.new(sanitize_params_event)
    @event.creator_id = current_user.id

    if @event.save
    flash[:notice]= "Event created succesfully"
    redirect_to root_path
    else
      render :new
    end
   
  end

  def index
   @events = Event.paginate(page: params[:page],per_page: 10)
  end

  def show
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error]= " Invalid path"
      redirect_to events_path
  end

  def sanitize_params_event
    params.require(:event).permit(:title, :location, :description, :date)
  end
end
