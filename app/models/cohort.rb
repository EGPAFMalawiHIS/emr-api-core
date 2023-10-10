# frozen_string_literal: true

# Model: Cohort
class Cohort < ApplicationRecord
  self.table_name = 'cohort'
  self.primary_key = 'cohort_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  has_many :cohort_member, foreign_key: cohort_id, primary_key: cohort_id

  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
