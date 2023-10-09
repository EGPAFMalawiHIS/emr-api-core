# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the notification_alert_recipient table
class AddPrimaryKeysAndIndexesToNotificationAlertRecipient < ActiveRecord::Migration[6.0]
  def up
    add_index :notification_alert_recipient, %i[alert_id user_id], unique: true
  end

  def down
    remove_index :notification_alert_recipient, %i[alert_id user_id]
  end
end
