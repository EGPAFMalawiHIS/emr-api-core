module PersonNameService
    def self.create_person_name(person, person_name_params)

        names = person_name_params.delete(:names).first
        given_name = names.delete(:given_name)
        family_name = names.delete(:family_name)

        person_name = PersonName.new
        person_name.given_name = given_name
        person_name.family_name = family_name
        person_name.person = person
        
        person_name.save!
        person_name
    end

    def self.update_person_name(person, person_name_params)
        person_name = PersonName.find_by(person_id: person.id)
        names = person_name_params.delete(:names).first
        given_name = names.delete(:given_name)
        family_name = names.delete(:family_name)

        person_name.given_name = given_name
        person_name.family_name = family_name
        person_name.person = person

        person_name.save!

        person_name
    end
end