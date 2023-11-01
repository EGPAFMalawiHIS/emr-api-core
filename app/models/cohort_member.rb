# frozen_string_literal: true

# Model: CohortMember
class CohortMember < ApplicationRecord
  self.table_name = 'cohort_member'
  self.primary_key = 'cohort_member_id'

  belongs_to :cohort, foreign_key: :cohort_id, primary_key: :cohort_id, optional: true
  belongs_to :patient, foreign_key: :patient_id, primary_key: :patient_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true

  validates :cohort_id, presence: true
  validates :patient_id, presence: true
  validates :start_date, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
