class VisitService < OpenmrsService

    def self.find_visits(params)
        Visit.where(params)
    end

    def self.create_visit(params)
        patient = Person.find_by_uuid(params[:patient])
        visit_type = VisitType.find_by_uuid(params[:visit_type])
        location = Location.find_by_uuid(params[:location])
        indication = ConceptName.find_by_name(params[:indication])
        stop_datetime = params[:stop_datetime]
        start_datetime = params[:start_datetime]
        encounters = params.delete(:encounters)
        attributes = params.delete(:attributes)

        visit = Visit.new
        visit.patient = patient
        visit.visit_type = visit_type
        visit.location = location
        visit.indication_concept_id = indication&.concept_id
        visit.date_stopped = stop_datetime if stop_datetime
        visit.date_started = start_datetime if start_datetime
        visit.save!

        unless encounters.nil?
            encounters.each do |encounter|
                visit.add_encounter(Encounter.find_by_uuid(encounter))
            end
        end

        visit
    end

    def self.update_visit(params)
        raise NotImplementedError
    end
end