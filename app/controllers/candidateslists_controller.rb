# frozen_string_literal: true

# CandidateslistsController controller
class CandidateslistsController < ApplicationController
  def index
    @userlists = User.all.select { |user| user.candidate? && user.constituency_name == current_user.constituency_name }
  end
end
