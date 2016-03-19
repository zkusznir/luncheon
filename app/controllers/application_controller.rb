class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in

  def current_user
    User.find_by_uid(session[:id]) if session[:id]
  end

  def logged_in
    redirect_to root_path if session[:id].nil?
  end
end
