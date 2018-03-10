require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario 'Show welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome!')
  end

  scenario 'Click link to list customers' do
    visit(root_path)
    expect(find('ul li')).to have_link('List customer')
  end
end
