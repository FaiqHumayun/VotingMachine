class User < ApplicationController
  # before_action :configure_permitted_parameters

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:invite,
  #                                     keys: %i[name cnic constituency_name email user_status constituency_id])
  #   devise_parameter_sanitizer.permit(:accept_invitation, keys: [:image])
  # end
end
