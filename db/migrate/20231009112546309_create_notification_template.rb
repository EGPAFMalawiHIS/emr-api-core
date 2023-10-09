# frozen_string_literal: true

# Migration responsible for creating the notification_template table
class CreateNotificationTemplate < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_template, id: false do |t|
      t.bigint :template_id, null: false, limit: 4
      t.string :name, limit: 50
      t.text :template, limit: 65535
      t.string :subject, limit: 100
      t.string :sender, limit: 255
      t.string :recipients, limit: 512
      t.bigint :ordinal, default: '0', limit: 4
      t.string :uuid, null: false, limit: 38
    end
  end
end
