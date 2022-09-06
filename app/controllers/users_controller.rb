# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  before_action :find_user, only: %i[update]
  def index
    @userlists = User.all
  end

  def candidates
    @userlists = Constituency.find_by(id: current_user.constituency_id).users.get_candidates_of_that_constituency
  end

  def voters
    @userlists = Constituency.find_by(id: current_user.constituency_id).users
  end

  def update
    current_user.update(voted: true)
    flash[:alert] = 'Voted'
    redirect_to candidates_users_path
  end

  private

  def find_user
    @candidate = User.find_by(id: params[:id])
    @candidate.increment!(:total_votes_gain) # rubocop:disable Rails/SkipsModelValidations
  end
end
