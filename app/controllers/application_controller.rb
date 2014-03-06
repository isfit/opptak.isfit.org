class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def set_language
    unless session[:locale]
      country_code = get_country_code_by_id(request.remote_ip)
      if country_code =='no'
        Language.set('no')
        I18n.locale = 'no'
      else
        Language.set('en')
        I18n.locale = 'en'
      end
      session[:locale] = Language.to_s
    end
    Language.set(session[:locale])
    I18n.locale = session[:locale]

    if params[:locale] =~/en|no/
      Language.set(params[:locale])
      I18n.locale = params[:locale]
      session[:locale] = Language.to_s
      redirect_to request.env["HTTP_REFERER"] || root_path
    end
  end

  def get_country_code_by_id(ip)
    begin
      output= IO.popen("whois #{ip} | grep country:")
      output.gets[8..-1].strip.downcase
    rescue
      "en"
    end
  end

end
