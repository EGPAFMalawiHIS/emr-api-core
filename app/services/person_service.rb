class PersonService < OpenmrsService

    def self.create_person(person_params)
        birthdate = person_params.delete(:birthdate)
        gender = person_params.delete(:gender)
        birthdate_estimated = person_params.delete(:birthdateEstimated)
        creator = person_params.delete(:creator)
        age = person_params.delete(:age)
        birthtime = person_params.delete(:birthtime)

        if age.present? && birthdate.blank?
            birthdate = Date.new(age.to_i, 6, 15)
            birthdate_estimated = true
        end

        person = Person.new(
            birthdate: birthdate,
            gender: gender,
            birthdate_estimated: birthdate_estimated || false,
            birthtime: birthtime,
            creator: creator
        )
        person.save!
        
        # Create the person name
        person_name = PersonNameService.create_person_name(person, person_params)

        # Create the person address
        address_params = person_params.delete(:addresses)
        person_address = PersonAddressService.create_person_address(person, address_params) if address_params.present?

        
        
        person
    end

    def self.update_person(person, person_params)
        birthdate = person_params.delete(:birthdate)
        gender = person_params.delete(:gender)
        birthdate_estimated = person_params.delete(:birthdateEstimated)

        PersonNameService.update_person_name(person_params) if person_params[:names].present?
        
        address_params = person_params.delete(:addresses)
        updated_person_address = PersonAddressService.update_person_address(address_params) if address_params.present?

        person.birthdate = birthdate
        person.gender = gender
        person.birthdate_estimated = birthdate_estimated

        person.save!

        person
    end

end