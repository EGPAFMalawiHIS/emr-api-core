# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the xforms_medical_history_field table
class AddPrimaryKeysAndIndexesToXformsMedicalHistoryField < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE xforms_medical_history_field ADD PRIMARY KEY (field_id)"
  end
end
