class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = Admin.find_by(username: params[:admin][:username])
    if user.present? && user.authenticate(params[:admin][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully"
      redirect_to root_path
    else
      flash.now[:danger] = "Your username or password is incorrect"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  
end