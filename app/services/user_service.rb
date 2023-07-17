module UserService
    def self.create_user(user_params, person_params, role_params)
        ActiveRecord::Base.transaction do
            # Create the person
            person = PersonService.create_person(person_params)

            # Create the person name
            person_name = PersonNameService.create_person_name(person, person_params)

            # Create the person address
            address_params = person_params.delete(:addresses).first.to_h
            person_address = PersonAddressService.create_person_address(person, address_params)

            # Create the user
            user = User.new
            user.username = user_params[:username]
            user.password = Digest::SHA1.hexdigest(user_params[:password])
            user.salt = SecureRandom.base64
            user.person = person
            user.creator = User.current.id
            user.save!
            
            # Create roles and associate them with the user
            roles = role_params.to_a.map { |role| Role.find_by_role(role['name']) }
            
            roles.each do |role|
                user_role = UserRole.new
                user_role.user = user
                user_role.role = role
                user_role.save!
            end

            user
        end
    end
end