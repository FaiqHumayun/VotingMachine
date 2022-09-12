# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request, type: :model do
  let(:request) { create :request }
  let(:user) { create :user }

  describe 'association is valid with' do
    it 'has_one avatar' do
      expect(request).to have_one_attached(:avatar)
    end
  end

  describe 'attibutes' do
    it 'is valid with name' do
      expect(request).to validate_presence_of(:name)
    end

    it 'is valid with constituency_name' do
      expect(request).to validate_presence_of(:constituency_name)
    end

    it 'is valid with party_name' do
      expect(request).to validate_presence_of(:party_name)
    end

    it 'is valid with cnic' do
      expect(request).to validate_presence_of(:cnic)
    end

    it 'validates cnic length' do
      expect(request).to validate_length_of(:cnic).is_equal_to(13)
    end
  end

  describe 'access_credentials' do
    it 'checks credentials' do
      request.access_credentials(user)
      expect(user.name).to eq(request.name)
    end
  end

  describe 'update_status' do
    it 'confirms updation to candidate if user is voter' do
      user.user_status = 'voter'
      request.update_status(user)
      expect(request.request_status).to eq('approved')
    end

    it 'confirms updation to super_admin if user is admin' do
      user.user_status = 'admin'
      request.update_status(user)
      expect(request.request_status).to eq('approved')
    end
  end
end
