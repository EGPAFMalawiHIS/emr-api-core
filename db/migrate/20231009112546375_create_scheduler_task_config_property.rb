# frozen_string_literal: true

# Migration responsible for creating the scheduler_task_config_property table
class CreateSchedulerTaskConfigProperty < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduler_task_config_property, id: false do |t|
      t.bigint :task_config_property_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.text :value, limit: 65535
      t.bigint :task_config_id, limit: 4
    end
  end
end
