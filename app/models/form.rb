# frozen_string_literal: true

# Model: Form
class Form < ApplicationRecord
  self.table_name = 'form'
  self.primary_key = 'form_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :encounter, foreign_key: form_id, primary_key: form_id
  has_many :form_field, foreign_key: form_id, primary_key: form_id
  has_many :form_resource, foreign_key: form_id, primary_key: form_id
  has_many :formentry_xsn, foreign_key: form_id, primary_key: form_id
  has_many :htmlformentry_html_form, foreign_key: form_id, primary_key: form_id

  validates :name, presence: true
  validates :version, presence: true
  validates :published, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
