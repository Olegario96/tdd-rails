require 'car'

describe Car do
  it 'have_attributes' do
    subject.color = 'red'
    subject.model = 'i20'
    expect(subject).to have_attributes(color: starting_with('r'), model: 'i20')
  end
end
