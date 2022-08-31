# frozen_string_literal: true

# RequestPolicy
class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.user_status == 'admin' || @user.user_status == 'super_admin'
  end

  def new?
    @user.user_status == 'voter' || @user.user_status == 'admin'
  end

  def create?
    @user.user_status == 'voter' || @user.user_status == 'admin'
  end

  def update?
    @user.user_status == 'super_admin' || @user.user_status == 'admin'
  end
end
