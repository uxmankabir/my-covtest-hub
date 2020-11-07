class ApplicationController < ActionController::Base

  helper_method :current_admin
  helper_method :logged_in?

  def current_admin
    @current_admin ||= Admin.find(session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !!current_admin
  end

end
