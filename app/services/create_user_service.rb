# frozen_string_literal: true

class CreateUserService
  def self.[](email, passwd, *role_names)
    user = User.where(email: email).first_or_create! do |usr|
      usr.password = passwd
      usr.password_confirmation = passwd
    end
    role_names.each do |rol|
      role = CreateRoleService[rol]
      user.roles << role unless user.role?(rol)
    end
    user
  end
end
