describe (1..5), 'Ranges' do
  it '#cover' do
    # is_expected == expect(subject)
    is_expected.to cover(2, 5)
  end

  it { is_expected.not_to cover(0) }
end
