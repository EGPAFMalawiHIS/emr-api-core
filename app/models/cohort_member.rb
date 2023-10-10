# frozen_string_literal: true

# Model: CohortMember
class CohortMember < ApplicationRecord
  self.table_name = 'cohort_member'
  self.primary_key = 'cohort_member_id'

  validates :cohort_id, presence: true
  validates :patient_id, presence: true
  validates :start_date, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
