# frozen_string_literal: true

class CreateUsersRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :users_roles do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end

    add_index :user_roles, %i[user_id role_id], unique: true
  end
end
