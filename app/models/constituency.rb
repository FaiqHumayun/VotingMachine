# frozen_string_literal: true

class Constituency < ApplicationRecord
  has_many :users, dependent: :destroy
  scope :get_constituency, ->(id) { find_by('id = ?', id) }
end
