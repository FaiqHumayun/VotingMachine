# frozen_string_literal: true

module UpdateRequestStatus
  extend ActiveSupport::Concern

  def update_status
    @request = Request.find(params[:id])
    @request.update_attributes(request_status: :approved)
    make_candidate
    redirect_to requests_path
  end

  def make_candidate
    @user = User.find_by(cnic: @request.cnic)
    @user.update_attributes(party_name: @request.party_name, user_status: :candidate)
    @user.avatar.attach(@request.avatar)
    @user.avatar.attach(@request.avatar.blob_id)
    @user.avatar.attach(@request.avatar_blob)
  end
end
