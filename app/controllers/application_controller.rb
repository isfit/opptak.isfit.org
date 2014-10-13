class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all
  protect_from_forgery with: :exception
  before_action :set_locale
  #before_action :get_section

  def set_locale
    unless session[:locale]
      I18n.locale = 'no'
      session[:locale] = 'no'
    end
    I18n.locale = session[:locale]
    if params[:locale] =~/en|no/
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    end
  end
  def get_section
    positions = Position.published.includes(:groups).order("groups.section_id, groups.id, positions.title_no")
    @sections = []
    positions.each do |position|
      if not @sections.include? position.groups.first.section
         @sections << position.groups.first.section
      end
    end
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
    if(ApplicantUser.where(id: session[:user_id]).empty?)
      session[:user_id] = nil
    end
    @current_user ||= ApplicantUser.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
