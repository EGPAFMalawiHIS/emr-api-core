class User < RetirableRecord
  include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :person, presence: true
  
  belongs_to :person
  has_many :user_roles
  has_many :user_properties

  def as_json(options = {})
    super(options.merge(
      only: %i[username uuid],
      # include: { person },
      methods: %i[user_properties user_roles person]
    )
    )
  end


  def user_password
    @user_password ||= Password.new(password)
  end

  def self.create_hash(new_password)
    Password.create(new_password)
  end


  def authenticate(unencrypted_password)
    user_password == unencrypted_password
  end

  def self.current
    Thread.current['current_user']
  end

  def self.current=(user)
    Thread.current['current_user'] = user
  end
  
  def is_super_user?
    roles.downcase.include?('superuser')
  end
  
  def has_privilege?(privilege)
    return true if privilege.blank?
    return true if is_super_user?
    
    roles.any? { |role| role.has_privilege?(privilege) }
  end

  def add_property(property_name, property_value)
    user_properties << UserProperty.new(name: property_name, value: property_value)
  end

  def remove_property(property_name)
    user_properties.find_by(name: property_name).destroy
  end
  
  def has_role?(role_name, ignore_super_user = false)
    return true if !ignore_super_user && is_super_user?
    return false if roles.blank?
    
    roles.any? { |role| role.name.casecmp(role_name).zero? }
  end
  
  def get_privileges
    roles.map(&:privileges).flatten.uniq
  end
  
  def add_role(role)
    roles << role unless roles.include?(role)
  end

  def display_string
    return_string = ""
    return_string += "#{person.name.full_name} " if person.name
    return_string += "(#{username})"
    return_string
  end

  def get_all_roles
    roles
  end
  
  def remove_role(role)
    roles.delete(role)
  end
end
