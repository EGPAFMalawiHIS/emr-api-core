class Role < ApplicationRecord
    self.table_name = 'role'

    def as_json(options={})
        super(options.merge(only: [:uuid], methods: [:links, :display]))
    end

    def display
        role
    end

    def links
        {
            "rel": "self",
            "uri": "/api/v1/roles/#{uuid}"
          }
    end
end
