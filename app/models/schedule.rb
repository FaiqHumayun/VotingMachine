# frozen_string_literal: true

class Schedule < ApplicationRecord
  scope :get_schedule_to_edit, ->(id) { find_by('id = ?', id) }
end
