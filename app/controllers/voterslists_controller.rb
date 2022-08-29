class VoterslistsController < ApplicationController
  def index
    @userlists = User.all.select { |user| user.constituency_name == current_user.constituency_name }
  end
end
