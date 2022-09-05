# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def index
    @userlists = User.all
  end

  def candidates
    @userlists = User.get_candidates_of_that_constituency(current_user.constituency_id)
  end

  def voters
    @userlists = User.get_voters_of_that_constituency(current_user.constituency_id)
  end

  def update
    @user = User.get_user(params[:id])
    @user.increment!(:total_votes_gain) # rubocop:disable Rails/SkipsModelValidations
    authorize @user
    current_user.update(voted: true)
    flash[:alert] = 'Voted'
    redirect_to candidates_users_path
  end
end
