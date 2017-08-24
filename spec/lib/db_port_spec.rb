require_relative '../../lib/db_port'

describe DB do
  describe '.build' do
    it 'returns a datamapper adapter' do
      response = DB.build
      expect(response).to be_a(DB::DMAdapter)
    end
  end
end
