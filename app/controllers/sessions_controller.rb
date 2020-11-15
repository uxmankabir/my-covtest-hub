class SessionsController < ApplicationController
  before_action :authenticate
  before_action :already_logged_in, only: [:new, :create]

  def new
    
  end
  
  def create
    user = Admin.find_by(username: params[:admin][:username])
    if user.present? && user.authenticate(params[:admin][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully"
      set_token
      redirect_to admins_path
    else
      flash.now[:danger] = "Your username or password is incorrect"
      render 'new'
    end
  end
  
  def destroy
    current_admin.update(token: nil)
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end

  private
  
  def set_token
    Admin.find(current_admin.id).update(token: random_string)
  end

  def random_string
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    (0...100).map { o[rand(o.length)] }.join
  end
  
  def already_logged_in
    if logged_in?
      flash[:success] = "You have already logged in"
      redirect_to admins_path
    end
  end
  
  def authenticate
    unless logged_in?
      user = Admin.find_by(token: cookies[:uuid])
      session[:user_id] = user.id if user.present? && user.token.present?
    end
  end

end
