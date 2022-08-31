# frozen_string_literal: true

# UserlistsController
class UserlistsController < ApplicationController
  def index
    if user.admin? || user.super_admin?
      @userlists = User.all
    end
  end

  def update
    @user = User.find(params[:id])
    @user.increment!(:total_votes_gain)
    current_user.update_attributes(voted: true)
    redirect_to candidateslists_path
  end
end
