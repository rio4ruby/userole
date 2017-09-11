# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_roles
  has_many :roles, through: :users_roles

  validates :email,
            presence: true,
            format: /@/,
            uniqueness: true

  def role?(role_name)
    role_name.to_s.in?(role_names)
  end

  def role_names
    roles.map(&:name)
  end

  def admin?
    role?(:admin)
  end

  def me?(user)
    self == user
  end

  def can_edit?(user)
    admin? || me?(user)
  end

  def can_delete?(user)
    admin? & !me?(user)
  end

  def can_create?
    admin?
  end
end
