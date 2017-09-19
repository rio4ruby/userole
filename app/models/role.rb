# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users_roles
  has_many :users, through: :users_roles

  validates :name,
            presence: true,
            format: { with: /\A[a-z]+\z/, message: 'only allows lowercase letters' },
            uniqueness: true

  def in_use?
    users.size != 0
  end
end
