class Privilege < ApplicationRecord
    self.table_name = "privilege"

    def as_json(options={})
        super(options.merge(only: [:uuid, :description], methods: [:links, :display, :name]))
    end

    def display
        privilege
    end

    def name
        privilege
    end

    def links
        {
            "rel": "self",
            "uri": "/api/v1/privilege/#{uuid}"
        }
    end
end
