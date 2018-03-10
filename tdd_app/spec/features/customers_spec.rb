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

  scenario 'Create a valid customer' do
    visit(new_customer_path)
    fill_in('customer_name', with: Faker::Name.name)
    fill_in('customer_email', with: Faker::Internet.email)
    fill_in('customer_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('customer_avatar', "#{Rails.root}/spec/fixtures/avatar.jpg")
    choose(option: ['Y', 'N'].sample)
    click_on('Create')

    expect(page).to have_content('Customer created!')
  end

  scenario 'Reject a invalid customer' do
    visit(new_customer_path)
    click_on('Create')
    expect(page).to have_content("can't be blank")
  end
end
