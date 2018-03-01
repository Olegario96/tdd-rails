require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user, name: 'Gustavo Olegario') #(:customer)
    expect(customer.full_name).to eq('Sr. Gustavo Olegario')
  end

  it 'check if Sr. in full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'inheritance in factory girl' do
    customer = create(:customer_not_vip)
    expect(customer.vip).to be_falsy
  end

  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1) }
end
