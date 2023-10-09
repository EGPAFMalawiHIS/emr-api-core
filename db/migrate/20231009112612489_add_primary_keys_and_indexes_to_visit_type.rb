# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the visit_type table
class AddPrimaryKeysAndIndexesToVisitType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE visit_type ADD PRIMARY KEY (visit_type_id)"
  end
end
