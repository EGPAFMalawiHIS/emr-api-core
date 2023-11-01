class ConceptService < OpenmrsService

    def self.find_concepts(params)
        short_name = params[:short_name]

        concepts = Concept.all
        concepts = concepts.where('short_name like ?', "%#{short_name}%") unless short_name.blank?
        concepts
    end

    def self.create_concept(params)
        #  TODO: create concept
    end    
end
