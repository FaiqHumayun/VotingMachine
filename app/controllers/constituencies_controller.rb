# frozen_string_literal: true

# ConstituenciesController
class ConstituenciesController < ApplicationController
  before_action :find_constituency, only: %i[show]
  def index
    @constituencies = Constituency.all
    authorize @constituencies
  end

  def show
    @userlists = User.get_candidates_of_that_constituency(@constituency.id)
  end

  private

  def find_constituency
    @constituency = Constituency.find_by(id: params[:id])
  end
end
