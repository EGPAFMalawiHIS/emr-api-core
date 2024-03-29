# frozen_string_literal: true

# Model: Hl7Source
class Hl7Source < ApplicationRecord
  self.table_name = 'hl7_source'
  self.primary_key = 'hl7_source_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true

  has_many :hl7_in_queue, foreign_key: hl7_source, primary_key: hl7_source_id
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
