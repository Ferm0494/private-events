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
    User.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
end
