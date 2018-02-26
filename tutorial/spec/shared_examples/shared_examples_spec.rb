require 'car'

shared_examples 'status' do |status|
  it "#{status}" do
    car.send("#{status}!")
    expect(car.status).to eq("The car is #{status.capitalize}!")
  end
end

describe Car do
  subject(:car) { Car.new }

  it_should_behave_like 'status', :moving
  it_should_behave_like 'status', :stopping

  # it 'moving' do
  #   car.moving!
  #   expect(car.status).to eq('The car is Moving!')
  # end

  # it 'moving' do
  #   car.stopping!
  #   expect(car.status).to eq('The car is Stopping!')
  # end
end
