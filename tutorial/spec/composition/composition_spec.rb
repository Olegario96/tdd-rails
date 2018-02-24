describe 'Ruby on Rails' do
  it { is_expected.to start_with('Ruby').and end_with('Rails') }

  it { expect(fruits).to eq('banana').or eq('orange').or eq('grape') }

  def fruits
    %w(banana orange grape).sample
  end
end
