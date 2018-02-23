describe 'Classes' do
  it 'be_instance_of'do
    # Instance of is used to compare exactly the class
    expect(10).to be_instance_of(Integer)
  end

  it 'be_kind_of' do
    # Kind of accepts inheritance
    expect(10).to be_kind_of(Integer)
  end

  it 'be_a' do
    expect('ruby').to be_a(String)
  end

  it 'be_an' do
    expect(1).to be_an(Integer)
  end

  it 'respond_to' do
    expect('ruby').to respond_to(:size)
  end
end
