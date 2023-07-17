module PrivilegeService
    def self.create_privilege(params)
        privilege = Privilege.new(params)
        privilege.save
        privilege
    end

    def self.update_privilege(privilege, params)
        privilege.update(params)
        privilege
    end
end