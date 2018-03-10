require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Check link to list customer' do
    visit(root_path)
    expect(page).to have_link('List customers')
  end

  scenario 'Check page for list customers' do
    visit(root_path)
    click_on('List customer')
    expect(page).to have_content('List customers')
  end

  scenario 'Check link to create customer' do
    visit(root_path)
    click_on('List customer')
    expect(page).to have_link('Create customer')
  end

  scenario 'Check form for new client' do
    visit(customers_path)
    click_on('Create customer')
    expect(page).to have_content('New client')
  end
end
