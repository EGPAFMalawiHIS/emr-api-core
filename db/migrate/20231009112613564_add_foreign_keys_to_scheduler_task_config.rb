# frozen_string_literal: true

# Migration responsible for adding foreign keys to the scheduler_task_config table
class AddForeignKeysToSchedulerTaskConfig < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :scheduler_task_config, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :scheduler_task_config, :users, column: :created_by, primary_key: :user_id
  end
end
