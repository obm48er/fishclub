class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_q
  protected
   def set_q
    @q = Post.published.order(created_at: :desc).ransack(params[:q])
   end

   def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_homes_path
    else
      root_path
    end
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
