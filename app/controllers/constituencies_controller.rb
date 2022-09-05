# frozen_string_literal: true

# ConstituenciesController
class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
    authorize @constituencies
  end

  def show
    @userlists = User.get_candidates_of_that_constituency(params[:id])
  end
end
