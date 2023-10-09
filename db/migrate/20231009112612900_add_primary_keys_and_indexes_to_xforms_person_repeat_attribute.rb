# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the xforms_person_repeat_attribute table
class AddPrimaryKeysAndIndexesToXformsPersonRepeatAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE xforms_person_repeat_attribute ADD PRIMARY KEY (person_repeat_attribute_id)"
  end
end
