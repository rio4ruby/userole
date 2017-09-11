# frozen_string_literal: true

class CreateRoleService
  def self.[](role_name)
    Role.where(name: role_name.to_s).first_or_create!
  end
end
