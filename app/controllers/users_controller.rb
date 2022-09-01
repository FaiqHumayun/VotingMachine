# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def index
    @userlists = User.all
  end

  def candidates
    @userlists = User.all.select do |user|
      (user.candidate? || user.super_admin?) && user.constituency_id == current_user.constituency_id
    end
  end

  def voters
    @userlists = User.all.select { |user| user.constituency_id == current_user.constituency_id }
  end

  def update
    @user = User.find(params[:id])
    @user.increment!(:total_votes_gain) # rubocop:disable Rails/SkipsModelValidations
    current_user.update_attributes(voted: true) 
    flash[:alert] = 'Voted'
    redirect_to root_path
  end
end
