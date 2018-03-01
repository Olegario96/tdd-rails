require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs to' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Create list with 3 orders' do
    orders = create_list(:order, 3, description: "Test")
    expect(orders.size).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer_with_orders) #, :with_orders, qtt_orders: 5)
    expect(customer.orders.size).to eq(3)
  end
end
