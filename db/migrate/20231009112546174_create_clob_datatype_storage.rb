# frozen_string_literal: true

# Migration responsible for creating the clob_datatype_storage table
class CreateClobDatatypeStorage < ActiveRecord::Migration[6.0]
  def change
    create_table :clob_datatype_storage, id: false do |t|
      t.bigint :id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.text :value, null: false, limit: 4294967295
    end
  end
end
