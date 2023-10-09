# frozen_string_literal: true

# Migration responsible for creating the scheduler_task_config table
class CreateSchedulerTaskConfig < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduler_task_config, id: false do |t|
      t.bigint :task_config_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1024
      t.text :schedulable_class, limit: 65535
      t.datetime :start_time
      t.string :start_time_pattern, limit: 50
      t.bigint :repeat_interval, null: false, default: '0', limit: 4
      t.bigint :start_on_startup, null: false, default: '0', limit: 4
      t.bigint :started, null: false, default: '0', limit: 4
      t.bigint :created_by, default: '0', limit: 4
      t.datetime :date_created, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
      t.datetime :last_execution_time
    end
  end
end
