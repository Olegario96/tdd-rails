describe 'Equality matchers' do
  it '#equal - Test if is the same object' do
    x = 'ruby'
    y = 'ruby'
    expect(x).not_to equal(y)
  end

  it '#be - Test if is the same object' do
    x = 'ruby'
    y = 'ruby'
    expect(x).not_to be(y)
  end

  it '#eql - Test values from objects' do
    x = 'ruby'
    y = 'ruby'
    expect(x).to eql(y)
  end

  it '#eq - Test values from objects' do
    x = 'ruby'
    y = 'ruby'
    expect(x).to eq(y)
  end
end
