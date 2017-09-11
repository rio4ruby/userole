# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :require_no_authentication, only: :new
end
