require 'calculator'

describe Calculator do
  # subject(:calc) { described_class.new(params) }
  # Quando houver mais de um describe, prevalece o mais interno

  context '#sum' do
    it 'with positive numbers' do
      result = subject.sum(5, 7)
      expect(result).to eql(12)
    end

    it 'with negative numbers' do
      result = subject.sum(-5, -7)
      expect(result).to eql(-12)
    end

    it 'with negative/positive numbers' do
      result = subject.sum(-5, -7)
      expect(result).to eql(-12)
    end
  end
end