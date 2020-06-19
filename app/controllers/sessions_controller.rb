class SessionsController < ApplicationController
  before_action :redirecting, only: [:new, :create]
  
  
 
  def new
    @user = User.new  
  end

  def create
    @user = User.find_by( sanit_params_user)
    if  @user.nil?
      @user = User.new
      @user.errors.add(:username,"Invalid Try again!")
      render :new
    else
      session[:id] = @user.id
      redirect_to root_path
    end
  end

  def show
  end

  def destroy
    session[:id] = nil
    flash[:notice]="Logged out!"
    redirect_to root_path
  end

end
