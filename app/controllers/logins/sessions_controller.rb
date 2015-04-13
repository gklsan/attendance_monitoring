class Logins::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     #render :template => "#{Rails.root}/app/controllers/emptests/index"
     #render :action => "index", :controller => "emptests"
     #devise_for :logins, controllers: { sessions: "emptests_path" }
    # redirect_to "emptests_path"
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
