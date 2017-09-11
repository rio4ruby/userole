# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roles', type: :request do
  let(:admin) do
    CreateUserService['admin@test.com', 'xxxxxx', :admin]
  end

  let(:user) do
    CreateUserService['user@test.com', 'xxxxxx', :member]
  end

  context 'as admin' do
    before do
      sign_in admin
    end

    describe 'GET /roles' do
      it 'works' do
        get roles_path
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'as user' do
    before do
      sign_in user
    end

    describe 'GET /roles' do
      it 'redirects' do
        get roles_path
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
