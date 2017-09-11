# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:pwargs) { { password: 'xxxxxx', password_confirmation: 'xxxxxx' } }

    it 'sets an error when email is blank' do
      user = User.create(pwargs.merge(email: ''))
      expect(user.errors[:email]).to include 'is invalid'
    end
    it 'sets an error when email is not an email' do
      user = User.create(pwargs.merge(email: 'myuser'))
      expect(user.errors[:email]).to include 'is invalid'
    end
    it 'sets an error when name is a duplicate' do
      User.create(pwargs.merge(email: 'myuser@test.com'))
      user = User.create(pwargs.merge(email: 'myuser@test.com'))
      expect(user.errors[:email]).to include 'has already been taken'
    end
    it 'works when email is good' do
      user = User.create(pwargs.merge(email: 'myuser@test.com'))
      expect(user.errors).to be_empty
    end
  end

  describe 'status methods' do
    let(:pwargs) { { password: 'xxxxxx', password_confirmation: 'xxxxxx' } }
    let(:admin) { CreateUserService['admin@x.com', 'xxxxxx', :admin] }
    let(:user) { CreateUserService['user@x.com', 'xxxxxx', :member, :other] }

    it 'role?' do
      expect(user.role?(:admin)).to be_falsey
      expect(user.role?(:member)).to be_truthy
    end

    it 'role_names' do
      expect(user.role_names).to eq %w[member other]
    end

    it 'admin?' do
      expect(user.admin?).to be_falsey
      expect(admin.admin?).to be_truthy
    end

    it 'can_edit?' do
      expect(user.can_edit?(admin)).to be_falsey
      expect(user.can_edit?(user)).to be_truthy
      expect(admin.can_edit?(admin)).to be_truthy
      expect(admin.can_edit?(user)).to be_truthy
    end

    it 'can_delete?' do
      expect(user.can_delete?(admin)).to be_falsey
      expect(user.can_delete?(user)).to be_falsey
      expect(admin.can_delete?(admin)).to be_falsey
      expect(admin.can_delete?(user)).to be_truthy
    end

    it 'can_create?' do
      expect(user.can_create?).to be_falsey
      expect(admin.can_create?).to be_truthy
    end
  end
end
