# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person_merge_log table
class AddPrimaryKeysAndIndexesToPersonMergeLog < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person_merge_log ADD PRIMARY KEY (person_merge_log_id)"
  end
end
