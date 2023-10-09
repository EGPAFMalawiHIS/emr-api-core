# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the program_attribute_type table
class AddPrimaryKeysAndIndexesToProgramAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE program_attribute_type ADD PRIMARY KEY (program_attribute_type_id)"
  end
end
