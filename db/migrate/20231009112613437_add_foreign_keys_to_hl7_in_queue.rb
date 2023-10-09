# frozen_string_literal: true

# Migration responsible for adding foreign keys to the hl7_in_queue table
class AddForeignKeysToHl7InQueue < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hl7_in_queue, :hl7_source, column: :hl7_source, primary_key: :hl7_source_id
  end
end
