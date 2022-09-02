# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_220_826_135_230) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
          unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'constituencies', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'winner_candidate_name', default: ''
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'requests', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'cnic', null: false
    t.string 'party_name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'constituency_name', null: false
    t.integer 'request_status', default: 0
  end

  create_table 'schedules', force: :cascade do |t|
    t.datetime 'election_start_time'
    t.datetime 'election_end_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'cnic', null: false
    t.boolean 'voted', default: false
    t.string 'constituency_name', null: false
    t.integer 'total_votes_gain', default: 0
    t.string 'party_name', default: ''
    t.integer 'user_status', default: 0
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.string 'invited_by_type'
    t.bigint 'invited_by_id'
    t.integer 'invitations_count', default: 0
    t.bigint 'constituency_id'
    t.index ['constituency_id'], name: 'index_users_on_constituency_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index %w[invited_by_type invited_by_id], name: 'index_users_on_invited_by_type_and_invited_by_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'users', 'constituencies'
end
