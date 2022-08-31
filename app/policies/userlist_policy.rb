# frozen_string_literal: true

# RequestPolicy
class UserlistPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.super_admin? || user.admin?
  end
end
