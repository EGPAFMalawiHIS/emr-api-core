module UserService
    def self.create_user(user_params, person_params, role_params)
        ActiveRecord::Base.transaction do
            # Create the person
            person = PersonService.create_person(person_params)
            username = user_params[:username]
            security_question = user_params[:security_question]
            security_answer = user_params[:security_answer]

            # Create the user
            user = User.new
            user.username = username
            user.system_id = username
            user.password = Digest::SHA1.hexdigest(user_params[:password])
            user.salt = SecureRandom.base64
            user.person = person
            user.secret_question = security_question
            user.secret_answer = security_answer
            user.creator = 1
            user.save!
            
            # Create roles and associate them with the user
            assign_user_roles(user, role_params)

            user
        end
    end

    def self.update_user(user, user_params, person_params, role_params)
        ActiveRecord::Base.transaction do
            updated_person = PersonService.update_person(user.person, person_params)

            user.username = user_params[:username] if user_params[:username].present?
            
            assign_user_roles(user, role_params)

            user.save!

            user
        end
    end

    private

    def self.assign_user_roles(user, params)
        # re assign roles
        UserRole.where(user: user).destroy_all
        params.each do |r|
            role = Role.find_by_role(r['name'])
            if role.blank?
                raise "Role #{r[:name]} does not exist"
            end
            UserRole.find_or_create_by(user: user, role: role)
        end
    end
end