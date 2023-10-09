# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_name_tag table
class AddPrimaryKeysAndIndexesToConceptNameTag < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_name_tag ADD PRIMARY KEY (concept_name_tag_id)"
  end
end
