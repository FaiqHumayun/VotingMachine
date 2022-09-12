# frozen_string_literal: true

class Request < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true
  validates :party_name, presence: true
  validates :avatar, presence: true
  validates :cnic, presence: true, length: { is: 13 }
  validates :constituency_name, presence: true
  enum request_status: { pending: 0, approved: 1 }

  def access_credentials(current_user)
    self.name = current_user.name
    self.cnic = current_user.cnic
    self.constituency_name = current_user.constituency_name
  end

  def update_status(user)
    if user.nil?
      false
    else
      update(request_status: :approved)
      user.update(party_name: party_name, user_status: :candidate) if user.voter!
      user.update(party_name: party_name, user_status: :super_admin) if user.admin?
      attach_avatar(user)
      true
    end
  end

  def attach_avatar(user)
    user.avatar.purge
    user.avatar.attach(avatar)
    user.avatar.attach(avatar.blob_id)
    user.avatar.attach(avatar_blob)
  end
end
