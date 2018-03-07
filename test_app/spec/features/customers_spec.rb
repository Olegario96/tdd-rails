require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature, js: true do
  it 'visit index page for customers' do
    visit(customers_path)
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end

  it 'creates customer using page object' do
    new_customer_form = NewCustomerForm.new
    new_customer_form.login.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address
    ).submit
  end

  it 'create a customer' do
    member = create(:member)
    login_as(member, :scope => :member)
    visit(new_customer_path)
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)
    click_button('Create Customer')
    expect(page).to have_content('Customer was successfully created.')
  end

  it 'ajax' do
    visit(customers_path)
    click_link('Add message')
    expect(find('#my-div').find('h1')).to have_content('Yes!')
  end

  it 'find' do
    visit(customers_path)
    click_link('Add message')
    expect(page).to have_content('Yes!')
  end
end
