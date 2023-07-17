module PersonAddressService
    def self.create_person_address(person, person_address_params)
        person_address = PersonAddress.new(person_address_params)
        person_address.person = person
        person_address.save!
        person_address
    end

    def self.update_person_address(person, person_address_params)
        person_address = PersonAddress.find_by(person_id: person.id)
        person_address.update_attributes(person_address_params)
        person_address
    end
end