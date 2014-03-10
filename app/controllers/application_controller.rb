class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
      I18n.locale = :no
  end
  private
  def require_signin!
    if current_user.nil?
      flash[:error] = "You have to be logged in to access this page"
      redirect_to signin_path
    end
  end
  helper_method :require_signin!

  def current_user
    @current_user ||= ApplicantUser.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
