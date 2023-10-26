# this class will hold all whitelisted params for the whole application models
module ParamConstants

    PERSON_WHITELISTED_PARAMS = [
        :gender, :age, :birthdate, :birthdateEstimated, :dead, :deathDate, :causeOfDeath, :deathdateEstimated,
        names: [
            :givenName, :middleName, :familyName, :familyName2, :preferred, :prefix, :familyNamePrefix, :familyNameSuffix, :degree
        ],
        addresses: [
            :preferred, :address1, :address2, :cityVillage, :stateProvince, :country, :postalCode, :countyDistrict, :address3, :address4, :address5, :address6, :startDate, :endDate, :latitude, :longitude
        ],
        attributes: [
            :attributeType, :value, :hydratedObject
        ]
    ]

    ROLE_WHITELISTED_PARAMS = [
        :name, :description,
        privileges: %i[name description],
        inheritedRoles: []
    ]
    
    USER_WHITELISTED_PARAMS = [
        :name, :description, :username, :password, :systemId, :secretQuestion,
        userProperties: {},
        person: PERSON_WHITELISTED_PARAMS,
        roles: ROLE_WHITELISTED_PARAMS,
        user: {}
    ]


end