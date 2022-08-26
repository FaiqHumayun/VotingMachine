class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
  end

  def show
    
  end
end
