class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  after_filter :store_location
  def store_location
    return unless request.get?
    if(request.path != "/logins/sign_in" &&
        request.path != "/logins/sign_out" &&
        request.path != "/logins/sign_up" &&
    !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end

  def before_sign_in_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
   	attendances_path
  end

  def after_sign_out_path_for(resource)
   	root_path
  end

  def after_sign_up_path_for(resource)
    attendances_path
  end




end
