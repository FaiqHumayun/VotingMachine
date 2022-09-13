# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  let(:request) { create :request }

  describe 'GET #index' do
    it 'display all requests' do
      create :schedule
      user = create :user
      sign_in(user)
      user.admin!
      get requests_path
      expect(response).to render_template(:index)
    end

    it 'fails for unauthorized users' do
      create :schedule
      user = create :user
      sign_in(user)
      user.voter!
      get requests_path
      expect(flash[:alert]).to eq('You are not authorized to do required action !')
    end
  end

  describe 'GET #new' do
    it 'new request' do
      create :schedule
      user = create :user
      sign_in(user)
      user.voter!
      get new_request_path
      expect(response).to render_template(:new)
    end
  end

  describe 'create#request' do
    it 'creates requests' do
      create :schedule
      user = create :user
      sign_in(user)
      params = { request: { party_name: Faker::Name.name } }
      post requests_path(params)
      expect(flash[:alert]).to eq('Request created')
    end

    it 'fails for unauthorized users' do
      create :schedule
      user = create :user
      sign_in(user)
      user.candidate!
      params = { request: { party_name: Faker::Name.name } }
      post requests_path(params)
      expect(flash[:alert]).to eq('You are not authorized to do required action !')
    end

    it 'doesnt creates if invalid params' do
      create :schedule
      user = create :user
      sign_in(user)
      user.voter!
      params = { request: { party_name: '' } }
      post requests_path(params)
      expect(flash[:notice]).to eq('request not created')
    end
  end

  describe 'update#request' do
    it 'updates request' do
      user = create :user
      patch request_path(request)
      expect(flash[:alert]).to eq('Request approved')
    end

    it 'fails updation of request' do
      user = create(:user, cnic: '1122334455637')
      patch request_path(request)
      expect(flash[:notice]).to eq('invalid request')
    end
  end
end
