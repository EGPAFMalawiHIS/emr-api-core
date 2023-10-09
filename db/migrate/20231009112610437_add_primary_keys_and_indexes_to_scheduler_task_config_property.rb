# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the scheduler_task_config_property table
class AddPrimaryKeysAndIndexesToSchedulerTaskConfigProperty < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE scheduler_task_config_property ADD PRIMARY KEY (task_config_property_id)"
  end
end
