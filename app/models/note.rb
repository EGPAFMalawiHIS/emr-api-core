# frozen_string_literal: true

# Model: Note
class Note < ApplicationRecord
  self.table_name = 'note'
  self.primary_key = 'note_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  has_many :note, foreign_key: parent, primary_key: note_id
  validates :text, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
