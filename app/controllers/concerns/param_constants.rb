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
        :name, :description, :username, :password, :systemId, :secretQuestion, :secretAnswer,
        userProperties: {},
        person: PERSON_WHITELISTED_PARAMS,
        roles: ROLE_WHITELISTED_PARAMS,
        user: {}
    ]

    PATIENT_SEARCH_PARAMS = [
       :givenName, :middleName, :familyName, :familyName2, :preferred, :prefix, :familyNamePrefix, :familyNameSuffix, :degree, :gender, :age, :birthdate, :birthdateEstimated, :dead, :deathDate, :causeOfDeath, :deathdateEstimated
    ]

    PATIENT_WHITELISTED_PARAMS = [
        :allergy_status,
        patient: {},
        person: PERSON_WHITELISTED_PARAMS,
        identifiers: %i[
            identifier
            identifierType
            location
            preferred
        ]
    ]


    VISIT_SEARCH_PARAMS = [
    ]

    VISIT_WHITELISTED_PARAMS = [
        :patient,
        :visitType,
        :startDatetime,
        :location,
        :indication,
        :stopDatetime,
        visit: {},
        encounters: [],
        attributes: [
            :attributeType,
            :value
        ]
    ]

    CONCEPT_WHITELISTED_PARAMS = [
       :shortName, :description, :formText, :datatype, :class, :isSet, :version
    ]

    ENCOUNTER_SEARCH_PARAMS = [
        :encounterType,
        :patient,
        :location,
        :form,
        :encounterDatetime,
        :visit
    ]

    ENCOUNTER_WHITELISTED_PARAMS = [
        :encounterType, :patient, :location, :form, :encounterDatetime, :visit, encounter: {}
    ]

    OBS_WHITELISTED_PARAMS = [
        :person, :concept, :encounter, :order, :obsDatetime, :location, :formFieldNamespace, :accessionNumber, :valueGroup, :valueCoded, :valueCodedName, :valueDrug, :valueDatetime, :valueNumeric, :valueModifier, :valueText, :comments, :valueComplex, :previousVersion, :status, :interpretation, :comment, :value, :formFieldPath, observation: {}, groupMembers: []
    ]

end