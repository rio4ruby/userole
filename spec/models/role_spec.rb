# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it 'sets an error when name is blank' do
      role = Role.create(name: '')
      expect(role.errors).to_not be_empty
    end
    it 'sets an error when name is not all lowercase' do
      role = Role.create(name: 'MyRole')
      expect(role.errors).to_not be_empty
    end
    it 'sets an error when name is a duplicate' do
      Role.create(name: 'myrole')
      role = Role.create(name: 'myrole')
      expect(role.errors).to_not be_empty
    end
    it 'works when name is all lowercase' do
      role = Role.create(name: 'myrole')
      expect(role.errors).to be_empty
    end
  end
end
