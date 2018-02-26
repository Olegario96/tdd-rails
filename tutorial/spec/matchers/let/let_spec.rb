$counter = 0

describe 'let' do
  let(:count) { $counter += 1 }

  it 'memorize value' do
    expect(count).to eq(1)
    expect(count).to eq(1)
  end

  it 'value not cached between tests' do
    expect(count).to eq(2)
  end

  # it 'memorize value/aggregate failures', :aggregate_failures do
  #   expect(count).to eq(4)
  #   expect(count).to eq(5)
  # end
end
