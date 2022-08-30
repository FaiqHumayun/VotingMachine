# frozen_string_literal: true

require 'test_helper'

class CandidateslistsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get candidateslists_index_url
    assert_response :success
  end
end
