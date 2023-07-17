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
            assign_user_roles(user, role_params)

            user
        end
    end

    def self.update_user(user, user_params, person_params, role_params)
        ActiveRecord::Base.transaction do
            updated_person = PersonService.update_person(user.person, person_params)

            updated_person_name = PersonNameService.update_person_name(updated_person, person_params)

            address_params = person_params.delete(:addresses).first.to_h
            updated_person_address = PersonAddressService.update_person_address(updated_person, address_params)

            user.username = user_params[:username] if user_params[:username].present?
            
            assign_user_roles(user, role_params)

            user.save!

            user
        end
    end

    private

    def assign_user_roles(user, params)
        # re assign roles
        UserRole.where(user: user).destroy_all
        params.each do |role|
            role = Role.find_by_role(role['name'])
            UserRole.find_or_create_by(user: user, role: role)
        end
    end
end