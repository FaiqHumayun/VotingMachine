# frozen_string_literal: true

# RequestsController
class RequestsController < ApplicationController
  include UpdateRequestStatus
  include RequestsHelper
  def index
    @requests = Request.all
    authorize @requests
  end

  def new
    @request = Request.new
    authorize @request
  end

  def update
    authorize @request
    update_status
  end

  def create
    @request = Request.new(request_params)
    authorize @request
    access_credentials
    if @request.save
      redirect_to candidateslists_path
    else
      render 'new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:party_name, :avatar)
  end
end
