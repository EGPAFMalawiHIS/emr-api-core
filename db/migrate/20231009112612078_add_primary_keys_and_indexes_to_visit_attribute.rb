# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the visit_attribute table
class AddPrimaryKeysAndIndexesToVisitAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE visit_attribute ADD PRIMARY KEY (visit_attribute_id)"
  end
end
