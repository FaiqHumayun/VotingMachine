# frozen_string_literal: true

# ConstituenciesController
class ConstituenciesController < ApplicationController
  before_action :find_constituency, only: %i[show]
  def index
    @constituencies = Constituency.all
    authorize @constituencies
  end

  def show
    @userlists = @constituency.users.where(user_status: %i[candidate super_admin])
  end

  private

  def find_constituency
    @constituency = Constituency.find_by(id: params[:id])
  end
end
