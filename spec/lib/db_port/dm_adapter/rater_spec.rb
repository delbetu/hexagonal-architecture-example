require_relative '../../../../lib/db_port/dm_adapter/rater'

describe DB::Rater do
  context 'when created last row on table rate has value 1.3' do
    it 'returns 1.3' do
      expect(subject.rate).to eq(1.3)
    end
  end
end
