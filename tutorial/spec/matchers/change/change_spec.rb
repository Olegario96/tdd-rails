require 'counter'

describe 'Matcher change' do
  it { expect{Counter.incrementor}.to change{ Counter.quantity } }
  it { expect{Counter.incrementor}.to change{ Counter.quantity }.by(1) }
  it { expect{Counter.incrementor}.to change{ Counter.quantity }.from(2).to(3) }
end
