class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :cnic, :constituency_name, :email, :user_status])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:image])
  end
end
