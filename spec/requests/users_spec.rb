# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create :user }

  describe 'GET #index' do
    it 'display all users' do
      sign_in(user)
      create :schedule
      user.admin!
      get users_path
      expect(response).to render_template(:index)
    end

    it 'fails for unauthorized user' do
      sign_in(user)
      create :schedule
      user.voter!
      get users_path
      expect(flash[:alert]).to eq('You are not authorized to do required action !')
    end
  end

  describe 'GET #candidates' do
    it 'display all candidates' do
      sign_in(user)
      create :schedule
      get candidates_users_path
      expect(response).to render_template(:candidates)
    end
  end

  describe 'GET #voters' do
    it 'display all voters to candidate' do
      sign_in(user)
      create :schedule
      user.candidate!
      get voters_users_path
      expect(response).to render_template(:voters)
    end

    it 'fails for unauthorized user' do
      sign_in(user)
      create :schedule
      user.voter!
      get voters_users_path
      expect(flash[:alert]).to eq('You are not authorized to do required action !')
    end
  end

  describe 'UpdateVoter' do
    it 'Update voter to voted' do
      sign_in(user)
      create :schedule
      patch user_path(user)
      expect(flash[:alert]).to eq('Voted')
    end
  end
end
