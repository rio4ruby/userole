# frozen_string_literal: true

class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :role, uniqueness: { scope: :user, message: 'is already assigned to user' }
end
