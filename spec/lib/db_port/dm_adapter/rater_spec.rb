require_relative '../../../../lib/db_port'
require_relative '../../../../lib/db_port/dm_adapter/rater'
require 'byebug'

describe DB::Rater do
  context 'when created last row on table rate has value 1.3' do
    before do
      DB.build(DB::DATAMAPPER_PG)
      DB.load_fake_data
    end
    subject(:rater) { DB::Rater.new(DB::DMSchema::Rate) }

    it 'returns the value stored on load_fake_data' do
      expect(rater.rate).to eq(1.5)
    end
  end
end
