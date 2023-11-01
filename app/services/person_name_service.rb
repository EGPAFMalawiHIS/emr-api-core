class PersonNameService < OpenmrsService

    def self.create_person_name(person, params)

        names = params.delete(:names)

        person_names = names.collect! { |name| 

            given_name = name.delete(:given_name)
            middle_name = name.delete(:middle_name)
            family_name = name.delete(:family_name)
            preferred = name.delete(:preferred)
            prefix = name.delete(:prefix)

            person_name = PersonName.new
            person_name.given_name = given_name
            person_name.middle_name = middle_name
            person_name.family_name = family_name
            person_name.person = person
            person_name.preferred = preferred || false
            
            person_name.save!

            person_name
        }
        person_names
    end

    def self.update_person_name(params)
        names = params.delete(:names)
        
        person_names = names.collect! { |name|
        
            name_id = name[:person_name_id]
            
            person_name = PersonName.find_by(person_name_id: name_id)

            person_name.update_attributes(name)

            person_name.save!

            person_name
        }

        person_names
    end
end