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
    expect(page).to have_content("em branco")
  end

  scenario 'Show a customer' do
    customer = create(:customer)
    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
  end

  scenario 'Testing index' do
    customer1 = create(:customer)

    customer2 = create(:customer)

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  scenario 'Update customer' do
    customer = create(:customer)

    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('customer_name', with: new_name)
    click_on('Update')
    expect(page).to have_content('Customer updated!').and have_content(new_name)
  end

  scenario 'Click show link' do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[2]/a').click
    expect(page).to have_content('Showing customer')
  end

  scenario 'Click edit link' do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[3]/a').click
    expect(page).to have_content('Editing customer')
  end

  scenario 'Click delete link', js: true do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[4]/a').click
    1.second
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Customer deleted!')
  end
end
