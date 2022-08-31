# frozen_string_literal: true

# RequestPolicy
class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def update?
    @user.user_status == 'super_admin' || @user.user_status == 'admin'
  end
end
