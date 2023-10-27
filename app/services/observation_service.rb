class ObservationService < OpenmrsService

    def self.create_observations(encounter, obs, parent=nil)
        obs.collect! do |ob|
            child_obs = ob[:group_members]

            concept = ob[:concept]
            person = Person.find_by_uuid(ob[:person])
            obs_datetime = ob.delete(obs_datetime) || Time.now
            encounter = Encounter.find_by_uuid(ob[:encounter])
            status = ob[:status] || 'FINAL'
            
            accession_number = ob.delete(accession_number)
            order = Order.find_by_uuid(ob[:order]) if ob[:order]

            observation = Observation.new
            observation.encounter = encounter
            observation.concept = Concept.find_by_uuid(concept)
            observation.person = person
            observation.obs_datetime = obs_datetime
            observation.order = order if order
            observation.accession_number = accession_number
            observation.status = status
            observation.obs_group = parent if parent
            observation.save!

            unless child_obs.blank?
                create_observations(encounter, child_obs, observation)
            end
        end
    end
end