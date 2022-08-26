class Constituency < ApplicationRecord
  validates :name, :uniqueness => true
  has_many :users
end
