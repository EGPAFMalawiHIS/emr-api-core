# frozen_string_literal: true

# Model: ConceptName
class ConceptName < ApplicationRecord
  self.table_name = 'concept_name'
  self.primary_key = 'concept_name_id'

  default_scope { where(locale: I18n.locale) }

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  has_many :concept_name_tag_map, foreign_key: :concept_name_id, primary_key: :concept_name_id
  has_many :concept_word, foreign_key: :concept_name_id, primary_key: :concept_name_id
  has_many :conditions, foreign_key: :condition_coded_name, primary_key: :concept_name_id
  has_many :encounter_diagnosis, foreign_key: :diagnosis_coded_name, primary_key: :concept_name_id
  has_many :obs, foreign_key: :value_coded_name_id, primary_key: :concept_name_id

  validates :name, presence: true
  validates :locale, presence: true
end
