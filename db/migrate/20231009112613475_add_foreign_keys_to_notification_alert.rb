# frozen_string_literal: true

# Migration responsible for adding foreign keys to the notification_alert table
class AddForeignKeysToNotificationAlert < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notification_alert, :users, column: :creator, primary_key: :user_id
    add_foreign_key :notification_alert, :users, column: :changed_by, primary_key: :user_id
  end
end
