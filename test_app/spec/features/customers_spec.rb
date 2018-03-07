require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'visit index page for customers' do
    visit(customers_path)
    save_and_open_page
    expect(page).to have_current_path(customers_path)
  end
end
