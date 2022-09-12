# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Schedules', type: :request do
  let(:schedule) { create :schedule }

  describe 'GET #index' do
    it 'display all schedules' do
      get schedules_path
      expect(response).to render_template(:index)
    end
  end

  describe 'update#schedule' do
    it 'updates schedule' do
      user = create :user
      sign_in(user)
      user.admin!
      params = { schedule: { election_start_time: DateTime.now, election_end_time: DateTime.tomorrow }, id: schedule.id }
      put schedule_path(params)
      expect(flash[:alert]).to eq('Schedule edited')
    end

    it 'doesnt updates if not authorized user' do
      user = create :user
      sign_in(user)
      user.voter!
      params = { schedule: { election_start_time: DateTime.now, election_end_time: DateTime.tomorrow }, id: schedule.id }
      put schedule_path(params)
      expect(flash[:alert]).to eq('You are not authorized to do required action !')
    end

    it 'doesnt updates if invalid params' do
      user = create :user
      sign_in(user)
      user.admin!
      params = { schedule: { election_start_time: '', election_end_time: '' }, id: schedule.id }
      put schedule_path(params)
      expect(flash[:alert]).to eq('schedule not edited')
    end
  end
end
