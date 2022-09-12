# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Schedule, type: :model do
  let(:schedule) { create :schedule }

  describe 'attibutes' do
    it 'is valid with election_start_time' do
      expect(schedule).to validate_presence_of(:election_start_time)
    end

    it 'is valid with election_end_time' do
      expect(schedule).to validate_presence_of(:election_end_time)
    end
  end
end
