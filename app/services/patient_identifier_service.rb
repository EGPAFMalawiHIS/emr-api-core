class PatientIdentifierService < OpenmrsService

    def self.create_patient_identifier(patient, params)

        params.collect! do |identifier|

            id_type = PatientIdentifierType.find_by_uuid(identifier[:identifier_type])
            prefered = identifier[:preferred] || false
            PatientIdentifier.create(
                identifier: identifier[:identifier],
                identifier_type: id_type,
                patient: patient,
                preferred: prefered
            )        
        end
    end
end