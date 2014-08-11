module ApplicationHelper
  def language_norwegian?
    session[:locale].eql? "no"
  end
end
