# frozen_string_literal: true

# ConstituenciesController
class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
    authorize @constituencies
  end

  def show
    @constituency = Constituency.find_by(id: params[:id])
    @userlists = User.all.select do |user|
      (user.candidate? || user.super_admin?) && user.constituency_id == @constituency.id
    end
  end
end
