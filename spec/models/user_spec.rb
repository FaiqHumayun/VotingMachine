# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe 'association is valid with' do
    it 'belongs to constituency' do
      expect(user).to belong_to(:constituency)
    end

    it 'has_one avatar' do
      expect(user).to have_one_attached(:avatar)
    end
  end

  describe 'attibutes' do
    it 'is valid with name' do
      expect(user).to validate_presence_of(:name)
    end

    it 'is valid with email' do
      expect(user).to validate_presence_of(:email)
    end

    it 'is valid with cnic' do
      expect(user).to validate_presence_of(:cnic)
    end

    it 'validates cnic length' do
      expect(user).to validate_length_of(:cnic).is_equal_to(13)
    end
  end
end
