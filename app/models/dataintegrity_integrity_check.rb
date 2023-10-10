# frozen_string_literal: true

# Model: DataintegrityIntegrityCheck
class DataintegrityIntegrityCheck < ApplicationRecord
  self.table_name = 'dataintegrity_integrity_checks'
  self.primary_key = 'dataintegrity_integrity_check_id'

  validates :check_name, presence: true
  validates :check_type, presence: true
  validates :check_code, presence: true
  validates :check_result_type, presence: true
  validates :check_fail, presence: true
  validates :check_fail_operator, presence: true
end
