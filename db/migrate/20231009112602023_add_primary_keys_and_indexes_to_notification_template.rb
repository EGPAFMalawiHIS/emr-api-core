# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the notification_template table
class AddPrimaryKeysAndIndexesToNotificationTemplate < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE notification_template ADD PRIMARY KEY (template_id)"
  end
end
