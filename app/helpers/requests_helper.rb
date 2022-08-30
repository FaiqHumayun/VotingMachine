# frozen_string_literal: true

# requestHelper
module RequestsHelper
  def access_credentials
    @request.name = current_user.name if current_user
    @request.cnic = current_user.cnic if current_user
    @request.constituency_name = current_user.constituency_name if current_user
  end
end
