# frozen_string_literal: true

# RequestsController
class RequestsController < ApplicationController
  include RequestsHelper
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
    access_credentials
    if @request.save
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

  private

  def request_params
    params.require(:request).permit(:party_name, :avatar)
  end
end
