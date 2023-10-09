# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the notification_alert table
class AddPrimaryKeysAndIndexesToNotificationAlert < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE notification_alert ADD PRIMARY KEY (alert_id)"
  end
end
