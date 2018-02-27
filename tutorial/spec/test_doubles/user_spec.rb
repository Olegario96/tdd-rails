describe 'Test double' do
  it 'example for double' do
    car = double('Car')
    allow(car).to receive_messages(model: 'Celta', color: 'black')
    # allow(car).to receive(:model).and_return('Celta')
    # allow(car).to receive(:color).and_return('black')
    puts car.model
    puts car.color
  end

  it 'as_null_object' do
    car = double('Car').as_null_object
    allow(car).to receive(:model).and_return('Celta')
    allow(car).to receive(:color).and_return('black')
    # puts car.model
    # puts car.color
    puts car.abc
  end
end
