class EncounterService < OpenmrsService

    def self.find_encounter(params)
        Encounter.where(params)
    end

    def self.create_encounter(params)
        visit = Visit.find_by_uuid(params[:visit])
        encounter_datetime = params[:encounter_datetime]
        patient = Patient.find_by_uuid(params[:patient])
        encounter_type = EncounterType.find_by_uuid(params[:encounter_type])
        location = Location.find_by_uuid(params[:location])
        encounter_providers = params[:encounter_providers]
        obs = params.delete(:obs)
        orders = params.delete(:orders)
        

        encounter = Encounter.new
        encounter.patient = patient
        encounter.encounter_datetime = encounter_datetime
        encounter.encounter_type = encounter_type
        encounter.location = location
        encounter.visit = visit
        encounter.save!

        # save providers for the encounter
        unless encounter_providers.blank?
            encounter_providers.each do |provider|
                provider = EncounterProvider.new
                provider.encounter = encounter
                provider.provider = Provider.find_by_uuid(provider[:provider])
                provider.encounter_role = EncounterRole.find_by_uuid(provider[:encounter_role])
                provider.save!
            end
        end
        
        unless obs.blank?
            ObservationService.create_observations(encounter, obs)
        end

        unless orders.blank?
            OrderService.create_orders(encounter, orders)
        end

        encounter
    end

    def self.update_encounter(encounter, params)
        encounter.update_attributes(params)
        encounter.save!
        encounter
    end
end