# frozen_string_literal: true

# RequestsController
class RequestsController < ApplicationController
  include UpdateRequestStatus
  include RequestsHelper
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def update
    update_status
  end

  def create
    @request = Request.new(request_params)
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
