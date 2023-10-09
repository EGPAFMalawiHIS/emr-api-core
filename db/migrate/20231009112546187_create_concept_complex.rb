# frozen_string_literal: true

# Migration responsible for creating the concept_complex table
class CreateConceptComplex < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_complex, id: false do |t|
      t.bigint :concept_id, null: false, limit: 4
      t.string :handler, limit: 255
    end
  end
end
