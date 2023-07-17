class User < ApplicationRecord
  belongs_to :system
  belongs_to :person
  has_many :user_roles, class_name: 'UserRole'
  has_many :roles, through: :user_roles

  def as_json(options={})
    super(options.merge(methods: [:roles, :person, :display, :links], only: [:uuid, :retired, :username, :system_id]))
  end

  def display
    "#{person.names.first.given_name} #{person.names.first.family_name}"
  end

  def links
    {
      "rel": "self",
      "uri": "/api/v1/users/#{uuid}"
    }
  end
end
