# frozen_string_literal: true

# Migration responsible for creating the dataintegrity_integrity_checks table
class CreateDataintegrityIntegrityChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :dataintegrity_integrity_checks, id: false do |t|
      t.bigint :dataintegrity_integrity_check_id, null: false, limit: 4
      t.string :check_name, null: false, limit: 100
      t.string :check_type, null: false, limit: 45
      t.string :check_code, null: false, limit: 1000
      t.string :check_result_type, null: false, limit: 45
      t.string :check_fail, null: false, limit: 100
      t.string :check_fail_operator, null: false, limit: 45
      t.string :check_repair_type, limit: 45
      t.string :check_repair, limit: 1000
      t.string :check_parameters, limit: 500
    end
  end
end
