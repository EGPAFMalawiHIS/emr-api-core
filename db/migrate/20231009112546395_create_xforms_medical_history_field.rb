# frozen_string_literal: true

# Migration responsible for creating the xforms_medical_history_field table
class CreateXformsMedicalHistoryField < ActiveRecord::Migration[6.0]
  def change
    create_table :xforms_medical_history_field, id: false do |t|
      t.bigint :field_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.bigint :tabIndex, limit: 4
    end
  end
end
