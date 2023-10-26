class PersonAddressService < OpenmrsService

    def self.create_person_address(person, person_address_params)

        person_address_params.collect! { |address|

            person_address = PersonAddress.new(address)
            person_address.person = person
            person_address.save!
            person_address
        }
    end

    def self.update_person_address(person_address_params)

        person_address_params.collect! { |address|

            person_address = PersonAddress.find(address[:person_address_id])
            person_address.update_attributes(address)
            person_address.save!
            person_address
        }
    end
end