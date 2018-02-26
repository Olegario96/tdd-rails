require 'car'

describe Car do
  before(:each) do
    @car = Car.new
  end

  after(:each) do
    @car.model = 'No model'
    puts "#{@car.inspect}"
  end

  it 'have_attributes' do
    @car.color = 'red'
    @car.model = 'i20'
    expect(@car).to have_attributes(color: starting_with('r'), model: 'i20')
  end

  it 'have_attributes' do
    @car.color = 'blue'
    @car.model = 'celta'
    expect(@car).to have_attributes(color: starting_with('b'), model: 'celta')
  end
end
