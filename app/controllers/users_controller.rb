class UsersController < ApplicationController
  before_action :authenticate, only: [:show]
  before_action :redirecting, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(sanit_params_user)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = if !params[:id].nil?
              User.find(params[:id])
            else
              User.find(session[:id])
            end
    User.paginate(page: params[:page], per_page: 15)
    @created_events = @user.created_events.paginate(page: params[:page], per_page: 15)
    @attending_events = @user.attending_events.recent_events.paginate(page: params[:page], per_page: 15)
    @expired_events = @user.attending_events.expired_events.paginate(page: params[:page], per_page: 15)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end
end
