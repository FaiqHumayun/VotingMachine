# frozen_string_literal: true

# AddRequestStatusToRequest
class AddRequestStatusToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :request_status, :integer, default: 0
  end
end
