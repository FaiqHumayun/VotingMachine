# frozen_string_literal: true

# ConstituenciesController
class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
  end

  def show
    @constituency = Constituency.find_by(id: params[:id])
    @userlists = User.all.select { |user| user.candidate? && user.constituency_id == @constituency.id }
  end
end
