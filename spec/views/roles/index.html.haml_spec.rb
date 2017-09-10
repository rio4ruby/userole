# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'roles/index', type: :view do
  before(:each) do
    assign(:roles, [
             Role.create!(
               name: 'rone'
             ),
             Role.create!(
               name: 'rtwo'
             )
           ])
  end

  it 'renders a list of roles' do
    render
    assert_select 'tr>td', text: 'rone'.to_s, count: 1
    assert_select 'tr>td', text: 'rtwo'.to_s, count: 1
  end
end
