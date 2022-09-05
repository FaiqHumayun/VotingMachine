# frozen_string_literal: true

# RequestsController
class RequestsController < ApplicationController
  before_action :find_request, only: %i[update]
  def index
    @requests = Request.all
    authorize @requests
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    authorize @request
    @request.access_credentials(current_user)
    if @request.save!
      flash[:alert] = 'Request created'
      redirect_to root_path
    else
      flash[:notice] = @request.error.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    update_status
  end

  def update_status
    @request.update(request_status: :approved)
    make_candidate
    flash[:alert] = 'Request approved'
    redirect_to requests_path
  end

  def make_candidate
    @user = User.get_requesting_user(@request.cnic)
    @user.update(party_name: @request.party_name, user_status: :candidate) if @user.user_status == 'voter'
    @user.update(party_name: @request.party_name, user_status: :super_admin) if @user.user_status == 'admin'
    attach_symbol
  end

  def attach_symbol
    @user.avatar.purge
    @user.avatar.attach(@request.avatar)
    @user.avatar.attach(@request.avatar.blob_id)
    @user.avatar.attach(@request.avatar_blob)
  end

  private

  def request_params
    params.require(:request).permit(:party_name, :avatar)
  end

  def find_request
    @request = Request.find_by(id: params[:id])
  end
end
