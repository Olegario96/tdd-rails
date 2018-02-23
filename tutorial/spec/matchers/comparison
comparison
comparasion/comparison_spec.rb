describe 'Comparison matchers' do
  it '>' do
    expect(5).to be > 4
  end

  it '>= respecting lt' do
    expect(5).to be >= 4
  end

  it '>= respecting eqt' do
    expect(5).to be >= 5
  end

  it '<' do
    expect(2).to be < 4
  end

  it '<= respecting lt' do
    expect(2).to be <= 4
  end

  it '<= respecting eqt' do
    expect(2).to be <= 2
  end

  it 'be_between inclusive' do
    expect(2).to be_between(2,7).inclusive
  end

  it 'be_between exclusive' do
    expect(3).to be_between(2,7).exclusive
  end

  it 'match' do
    expect('fulano@email.com.br').to match(/..@../)
  end

  it 'start_with' do
    expect('gustavo').to start_with('gus')
  end

  it 'end_with' do
    expect('gustavo').to end_with('tavo')
  end
end
