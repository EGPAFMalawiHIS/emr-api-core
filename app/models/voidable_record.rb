class VoidableRecord < ApplicationRecord
  self.abstract_class = true

  include Auditable
  include Voidable

  default_scope { where(voided: 0) }
  scope :voided, -> { unscoped.where.not(voided: 0) }

  before_validation :set_default_void_fields, on: :create

  private

  def set_default_void_fields
    self.voided ||= 0
    self.creator = 1
    self.uuid = SecureRandom.uuid if self.class.column_names.include?('uuid')
  end

  
  belongs_to :creator_user, foreign_key: 'creator', class_name: 'User', optional: true

  validates :voided, inclusion: { in: [true, false] }
  validates :void_reason, presence: true, if: -> { voided && self.class.column_names.include?('void_reason') }
  validates :voided_by, presence: true, if: -> { voided && self.class.column_names.include?('voided_by') }
  validates :date_voided, presence: true, if: -> { voided && self.class.column_names.include?('date_voided') }
end
