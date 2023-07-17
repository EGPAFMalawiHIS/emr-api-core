class Person < ApplicationRecord
    self.table_name = 'person'
    has_many :names, class_name: 'PersonName', foreign_key: :person_id
    
    def as_json(options={})
        super(options.merge(only: [:uuid], methods: [:display, :links]))
    end

    def display
        "#{names.first.given_name} #{names.first.family_name}"
    end

    def links
        {
            "rel": "self",
            "uri": "/api/v1/people/#{uuid}"
          }
    end
end
