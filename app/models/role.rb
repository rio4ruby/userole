# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name,
            presence: true,
            format: { with: /\A[a-z]+\z/, message: 'only allows lowercase letters' },
            uniqueness: true
end
