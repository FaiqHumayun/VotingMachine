# frozen_string_literal: true

class Request < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true
  validates :party_name, presence: true
  validates :avatar, presence: true
  validates :cnic, presence: true, length: { is: 13 }
  enum request_status: { pending: 0, approved: 1, rejected: 2 }

  def access_credentials(current_user)
    self.name = current_user.name
    self.cnic = current_user.cnic
    self.constituency_name = current_user.constituency_name
  end

  def update_status(user)
    @user = User.find(user.id)
    update(request_status: :approved)
    @user.update(party_name: party_name, user_status: :candidate) if @user.user_status == 'voter'
    @user.update(party_name: party_name, user_status: :super_admin) if @user.user_status == 'admin'
    attach_avatar
    true
  end

  def attach_avatar
    @user.avatar.purge
    @user.avatar.attach(avatar)
    @user.avatar.attach(avatar.blob_id)
    @user.avatar.attach(avatar_blob)
  end
end
