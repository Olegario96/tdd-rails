require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Order number 1' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Multiple orders' do
    orders = create_list(:order, 3, description: "Test")
    puts orders
    expect(orders.size).to eq(3)
  end
end
