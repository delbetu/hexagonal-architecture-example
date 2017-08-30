require_relative '../../lib/db_port'

describe DB do
  describe '.build' do
    it 'pick up the right adapter' do
      response = DB.build(DB::DATAMAPPER_PG)
      expect(response).to be_a(DB::DMAdapter)
    end

    context 'when adapter does not exist' do
      it 'raises an error' do
        expect { DB.build('no exists') }.to raise_error(DB::NoAdapterFound)
      end
    end
  end
end
