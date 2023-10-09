# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the visit_attribute_type table
class AddPrimaryKeysAndIndexesToVisitAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE visit_attribute_type ADD PRIMARY KEY (visit_attribute_type_id)"
  end
end
