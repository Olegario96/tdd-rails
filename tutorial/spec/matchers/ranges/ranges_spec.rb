describe (1..5), 'Ranges' do
  it '#cover' do
    expect(subject).to cover(2, 5)
  end

  it '#cover negative' do
    expect(subject).not_to cover(0)
  end
end
