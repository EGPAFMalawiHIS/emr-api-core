# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the field_answer table
class AddPrimaryKeysAndIndexesToFieldAnswer < ActiveRecord::Migration[6.0]
  def up
    add_index :field_answer, %i[field_id answer_id], unique: true
  end

  def down
    remove_index :field_answer, %i[field_id answer_id]
  end
end
