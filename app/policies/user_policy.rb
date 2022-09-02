# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.user_status == 'admin' || @user.user_status == 'super_admin'
  end

  def candidates?
    !@user.nil?
  end

  def voters?
    @user.user_status == 'super_admin' || @user.user_status == 'candidate'
  end
end
