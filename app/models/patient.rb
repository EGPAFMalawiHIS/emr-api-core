class Patient < VoidableRecord
  self.table_name = 'patient'
  self.primary_key = 'patient_id'

  validates :patient_id, presence: true

  def add_identifiers(patient_identifiers)
    patient_identifiers.each { |identifier| add_identifier(identifier) }
  end

  def add_identifier(patient_identifier)
    if patient_identifier.present?
      patient_identifier.patient = self
      return if self.identifiers.any? { |id| id.equals_content(patient_identifier) }
    end
    self.identifiers << patient_identifier
  end

  def remove_identifier(patient_identifier)
    self.identifiers.delete(patient_identifier) if patient_identifier.present?
  end

  def patient_identifier
    self.identifiers.find { |id| id.preferred && !id.voided } ||
    self.identifiers.find { |id| !id.voided } ||
    nil
  end

  def patient_identifier_by_type(pit)
    self.identifiers.find { |id| id.preferred && !id.voided && pit == id.identifier_type } ||
    self.identifiers.find { |id| !id.voided && pit == id.identifier_type } ||
    nil
  end

  def patient_identifier_by_type_id(identifier_type_id)
    self.identifiers.find { |id| id.preferred && !id.voided && identifier_type_id == id.identifier_type.patient_identifier_type_id } ||
    self.identifiers.find { |id| !id.voided && identifier_type_id == id.identifier_type.patient_identifier_type_id } ||
    nil
  end

  def patient_identifier_by_type_name(identifier_type_name)
    self.identifiers.find { |id| id.preferred && !id.voided && identifier_type_name == id.identifier_type.name } ||
    self.identifiers.find { |id| !id.voided && identifier_type_name == id.identifier_type.name } ||
    nil
  end

  def active_identifiers
    ids = self.identifiers.select { |id| id.preferred && !id.voided }
    non_preferred = self.identifiers.select { |id| !id.preferred && !id.voided }
    ids + non_preferred
  end

  def patient_identifiers(pit)
    self.identifiers.select { |id| !id.voided && pit == id.identifier_type }
  end
end

