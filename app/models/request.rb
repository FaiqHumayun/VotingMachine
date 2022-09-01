# frozen_string_literal: true

class Request < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true
  validates :cnic, presence: true, length: { is: 13 }
  enum request_status: { pending: 0, approved: 1, rejected: 2 }
end
