# frozen_string_literal: true

# Migration responsible for adding foreign keys to the scheduler_task_config_property table
class AddForeignKeysToSchedulerTaskConfigProperty < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :scheduler_task_config_property, :scheduler_task_config, column: :task_config_id, primary_key: :task_config_id
  end
end
