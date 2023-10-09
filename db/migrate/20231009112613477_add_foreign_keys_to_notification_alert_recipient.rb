# frozen_string_literal: true

# Migration responsible for adding foreign keys to the notification_alert_recipient table
class AddForeignKeysToNotificationAlertRecipient < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notification_alert_recipient, :users, column: :user_id, primary_key: :user_id
    add_foreign_key :notification_alert_recipient, :notification_alert, column: :alert_id, primary_key: :alert_id
  end
end
