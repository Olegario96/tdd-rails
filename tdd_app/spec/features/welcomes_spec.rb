require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario 'Show welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome!')
  end

  scenario 'click link to create new client' do
    visit(root_path)
    expect(find('ul li')).to have_link('Create client')
  end
end
