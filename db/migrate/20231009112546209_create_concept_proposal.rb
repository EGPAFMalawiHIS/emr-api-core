# frozen_string_literal: true

# Migration responsible for creating the concept_proposal table
class CreateConceptProposal < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_proposal, id: false do |t|
      t.bigint :concept_proposal_id, null: false, limit: 4
      t.bigint :concept_id, limit: 4
      t.bigint :encounter_id, limit: 4
      t.string :original_text, null: false, default: '', limit: 255
      t.string :final_text, limit: 255
      t.bigint :obs_id, limit: 4
      t.bigint :obs_concept_id, limit: 4
      t.string :state, null: false, default: '', limit: 32
      t.string :comments, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :locale, null: false, default: '', limit: 50
      t.string :uuid, null: false, limit: 38
    end
  end
end
