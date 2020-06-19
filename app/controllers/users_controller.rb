class UsersController < ApplicationController
    before_action :authenticate, only: [:show]
    before_action :redirecting, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
     @user = User.new(sanit_params_user())
    if @user.save
        session[:id] = @user.id
        redirect_to root_path
    else
        render :new
    end
  end

  def show
    if !params[:id].nil?
        @user = User.find(params[:id])
    else
        @user = User.find(session[:id])
    end
    User.paginate(page: params[:page], per_page: 5)
    
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  
  
end
