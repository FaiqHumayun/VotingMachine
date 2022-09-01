# frozen_string_literal: true

# requestHelper
module RequestsHelper
  def access_credentials
    @request.name = current_user.name if current_user
    @request.cnic = current_user.cnic if current_user
    @request.constituency_name = current_user.constituency_name if current_user
  end

  def update_status
    @request = Request.find(params[:id])
    @request.update_attributes(request_status: :approved)
    make_candidate
    flash[:alert] = 'Request approved'
    redirect_to requests_path
  end

  def make_candidate
    @user = User.find_by(cnic: @request.cnic)
    @user.update_attributes(party_name: @request.party_name, user_status: :candidate) if @user.user_status == 'voter'
    @user.update_attributes(party_name: @request.party_name, user_status: :super_admin) if @user.user_status == 'admin'
    attach_symbol
  end

  def attach_symbol
    @user.avatar.purge
    @user.avatar.attach(@request.avatar)
    @user.avatar.attach(@request.avatar.blob_id)
    @user.avatar.attach(@request.avatar_blob)
  end
end
