require_relative '../../../lib/rate_port/rate_persistor_in_memory'

describe RatePersistorInMemory do
  context 'when created last row on table rate has value 1.3' do
    before do
      TableRate.create(description: 'first value', value: 1.3)
    end
    it 'returns 1.3' do
      expect(subject.rate).to eq(1.3)
    end
  end
end
