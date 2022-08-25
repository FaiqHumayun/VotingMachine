class Request < ApplicationRecord

  validates :name, :presence => true
  validates :cnic, :uniqueness => true, :presence => true, :length => { :is => 13 }
  enum request_status: { pending: 0, approved: 1, rejected: 2}

  has_one_attached :avatar
end
