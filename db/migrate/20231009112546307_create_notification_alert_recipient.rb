# frozen_string_literal: true

# Migration responsible for creating the notification_alert_recipient table
class CreateNotificationAlertRecipient < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_alert_recipient, id: false do |t|
      t.bigint :alert_id, null: false, limit: 4
      t.bigint :user_id, null: false, limit: 4
      t.bigint :alert_read, null: false, default: '0', limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
