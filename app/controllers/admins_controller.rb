class AdminsController < ApplicationController
  before_action :admin_authenticated
  
  def index
    
  end

  def admin_authenticated
    unless logged_in?
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end
  
end
