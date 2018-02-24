describe 'Satisfy' do
  it {
    expect(10).to satisfy('be a multiple of 5') do |x|
      x % 5 == 0
    end
  }
end
