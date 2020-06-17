class UsersController < ApplicationController
    before_action :authenticate, only: [:show]
    before_action :redirecting, only:[:create, :new]
  def new
    @user = User.new
  end

  def create
     @user = User.new(sanit_params_user())
    if @user.save
        session[:id] = @user.id
        redirect_to root_path
    else
        flash[:error]= "User already exist !" 
    end
  end

  def show
  end

  
  
end
