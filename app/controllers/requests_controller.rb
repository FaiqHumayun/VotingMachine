class RequestsController < ApplicationController
  include UpdateRequestStatus
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
    if current_user

      @request.name = current_user.name
      @request.cnic = current_user.cnic
      @request.constituency_name = current_user.constituency_name

    end
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
