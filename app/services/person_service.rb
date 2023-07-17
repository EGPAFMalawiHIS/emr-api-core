module PersonService

    def self.create_person(person_params)
        birthdate = person_params.delete(:birthdate)
        gender = person_params.delete(:gender)
        birthdate_estimated = person_params.delete(:birthdate_estimated)
        creator = person_params.delete(:creator)

        person = Person.new(
            birthdate: birthdate,
            gender: gender,
            birthdate_estimated: birthdate_estimated,
            creator: creator
        )
        person.save!
        person
    end

    def self.update_person(person, person_params)
        birthdate = person_params.delete(:birthdate)
        gender = person_params.delete(:gender)
        birthdate_estimated = person_params.delete(:birthdate_estimated)

        person.birthdate = birthdate
        person.gender = gender
        person.birthdate_estimated = birthdate_estimated

        person.save!

        person
    end

end