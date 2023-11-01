class PatientService < OpenmrsService

    def self.find_patients(params)
        
        patients = Patient.where(params)
        patients
    end

    def self.create_patient(params)
        ActiveRecord::Base.transaction do

            person_params = params.delete(:person)
            identifiers_params = params.delete(:identifiers)
            
            # create person
            person = PersonService.create_person(person_params)
            
            # create patient
            patient = Patient.new
            patient.patient_id = person.id
            patient.save!

            # create patient identifiers
            PatientIdentifierService.create_patient_identifier(patient, identifiers_params) if identifiers_params.present?

            patient
        end
    end
end