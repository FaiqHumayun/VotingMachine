# frozen_string_literal: true

class ConstituencyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    !@user.nil?
  end

  def show?
    !@user.nil?
  end
end
