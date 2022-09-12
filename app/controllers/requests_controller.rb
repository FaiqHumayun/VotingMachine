# frozen_string_literal: true

# RequestsController
class RequestsController < ApplicationController
  before_action :find_request, only: %i[update]
  before_action :find_requesting_user, only: %i[update]
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
    if @request.save
      flash[:alert] = 'Request created'
      redirect_to root_path
    else
      flash[:notice] = 'request not created'
      render 'new'
    end
  end

  def update
    if @request.update_status(@user)
      flash[:alert] = 'Request approved'
      redirect_to requests_path
    else
      flash[:notice] = 'invalid request'
    end
  end

  private

  def request_params
    params.require(:request).permit(:party_name, :avatar)
  end

  def find_request
    @request = Request.find_by(id: params[:id])
  end

  def find_requesting_user
    @user = User.find_by(cnic: @request.cnic)
  end
end
