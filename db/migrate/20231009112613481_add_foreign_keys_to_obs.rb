# frozen_string_literal: true

# Migration responsible for adding foreign keys to the obs table
class AddForeignKeysToObs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :obs, :concept, column: :value_coded, primary_key: :concept_id
    add_foreign_key :obs, :drug, column: :value_drug, primary_key: :drug_id
    add_foreign_key :obs, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :obs, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :obs, :users, column: :creator, primary_key: :user_id
    add_foreign_key :obs, :obs, column: :obs_group_id, primary_key: :obs_id
    add_foreign_key :obs, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :obs, :concept_name, column: :value_coded_name_id, primary_key: :concept_name_id
    add_foreign_key :obs, :orders, column: :order_id, primary_key: :order_id
    add_foreign_key :obs, :person, column: :person_id, primary_key: :person_id
    add_foreign_key :obs, :obs, column: :previous_version, primary_key: :obs_id
    add_foreign_key :obs, :users, column: :voided_by, primary_key: :user_id
  end
end
