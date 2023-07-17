class Role < ApplicationRecord
    belongs_to :user
    self.table_name = 'role'

    def as_json(options={})
        super(options.merge(only: [:uuid, :description], methods: [:links, :display, :name]))
    end

    def display
        role
    end

    def name
        role
    end

    def links
        {
            "rel": "self",
            "uri": "/api/v1/roles/#{uuid}"
        }
    end
end
