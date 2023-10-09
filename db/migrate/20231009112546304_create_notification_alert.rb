# frozen_string_literal: true

# Migration responsible for creating the notification_alert table
class CreateNotificationAlert < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_alert, id: false do |t|
      t.bigint :alert_id, null: false, limit: 4
      t.string :text, null: false, limit: 512
      t.bigint :satisfied_by_any, null: false, default: '0', limit: 4
      t.bigint :alert_read, null: false, default: '0', limit: 4
      t.datetime :date_to_expire
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
