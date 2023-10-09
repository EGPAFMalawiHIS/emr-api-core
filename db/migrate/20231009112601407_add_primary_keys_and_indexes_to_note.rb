# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the note table
class AddPrimaryKeysAndIndexesToNote < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE note ADD PRIMARY KEY (note_id)"
  end
end
