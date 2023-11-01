# frozen_string_literal: true

# Model: Concept
class Concept < ApplicationRecord
  self.table_name = 'concept'
  self.primary_key = 'concept_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  belongs_to :concept_class, foreign_key: :class_id, primary_key: :concept_class_id, optional: true
  belongs_to :concept_datatype, foreign_key: :datatype_id, primary_key: :concept_datatype_id, optional: true

  has_many :allergy, foreign_key: :coded_allergen, primary_key: :concept_id
  has_many :allergy, foreign_key: :severity_concept_id, primary_key: :concept_id
  has_many :allergy_reaction, foreign_key: :reaction_concept_id, primary_key: :concept_id
  has_many :concept_answer, foreign_key: :answer_concept, primary_key: :concept_id
  has_many :concept_attribute, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_complex, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_description, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_name, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_numeric, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_proposal, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_reference_map, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_set, foreign_key: :concept_set, primary_key: :concept_id
  has_many :concept_state_conversion, foreign_key: :concept_id, primary_key: :concept_id
  has_many :concept_word, foreign_key: :concept_id, primary_key: :concept_id
  has_many :conditions, foreign_key: :condition_coded, primary_key: :concept_id
  has_many :drug, foreign_key: :dosage_form, primary_key: :concept_id
  has_many :drug, foreign_key: :concept_id, primary_key: :concept_id
  has_many :drug, foreign_key: :route, primary_key: :concept_id
  has_many :drug_ingredient, foreign_key: :ingredient_id, primary_key: :concept_id
  has_many :drug_ingredient, foreign_key: :units, primary_key: :concept_id
  has_many :drug_order, foreign_key: :dose_units, primary_key: :concept_id
  has_many :drug_order, foreign_key: :duration_units, primary_key: :concept_id
  has_many :drug_order, foreign_key: :quantity_units, primary_key: :concept_id
  has_many :drug_order, foreign_key: :route, primary_key: :concept_id
  has_many :encounter_diagnosis, foreign_key: :diagnosis_coded, primary_key: :concept_id
  has_many :field, foreign_key: :concept_id, primary_key: :concept_id
  has_many :field_answer, foreign_key: :answer_id, primary_key: :concept_id
  has_many :obs, foreign_key: :value_coded, primary_key: :concept_id
  has_many :obs, foreign_key: :concept_id, primary_key: :concept_id
  has_many :order_frequency, foreign_key: :concept_id, primary_key: :concept_id
  has_many :order_set_member, foreign_key: :concept_id, primary_key: :concept_id
  has_many :orders, foreign_key: :order_reason, primary_key: :concept_id
  has_many :patient_program, foreign_key: :outcome_concept_id, primary_key: :concept_id
  has_many :person, foreign_key: :cause_of_death, primary_key: :concept_id
  has_many :program, foreign_key: :concept_id, primary_key: :concept_id
  has_many :program, foreign_key: :outcomes_concept_id, primary_key: :concept_id
  has_many :program_workflow, foreign_key: :concept_id, primary_key: :concept_id
  has_many :program_workflow_state, foreign_key: :concept_id, primary_key: :concept_id
  has_many :provider, foreign_key: :role_id, primary_key: :concept_id
  has_many :provider, foreign_key: :speciality_id, primary_key: :concept_id
  has_many :test_order, foreign_key: :specimen_source, primary_key: :concept_id
  has_many :visit, foreign_key: :indication_concept_id, primary_key: :concept_id

end
