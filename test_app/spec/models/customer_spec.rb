require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user, name: 'Gustavo Olegario') #(:customer)
    expect(customer.full_name).to eq('Sr. Gustavo Olegario')
  end

  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1) }
end
