# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Constituency, type: :model do
  describe 'association is valid with' do
    it { is_expected.to have_many(:users).dependent(:destroy) }
  end
end
