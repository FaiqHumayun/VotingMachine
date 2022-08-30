# frozen_string_literal: true

class UserlistsController < ApplicationController
  def index
    @userlists = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.increment!(:total_votes_gain)
    current_user.update_attributes(voted: true)
    redirect_to candidateslists_path
  end
end
