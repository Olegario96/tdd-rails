describe 'Test double' do
  it '--' do
    car = double('Car')
    allow(car).to receive_messages(model: 'Celta', color: 'black')
    # allow(car).to receive(:model).and_return('Celta')
    # allow(car).to receive(:color).and_return('black')
    puts car.model
    puts car.color
  end
end
