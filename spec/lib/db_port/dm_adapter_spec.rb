require_relative '../../../lib/db_port/dm_adapter'

describe DB::DMAdapter do
  describe '.instance' do
    it 'returns an instance of DMAdapter' do
      expect(described_class.instance).to be_a(DB::DMAdapter)
    end
  end

  describe '#lookup' do
    context 'when requested service exists' do
      let(:dummy_class) { double('ServiceImplementation') }
      let(:services_mapping) do
        { 'service_name' => dummy_class }
      end
      subject { described_class.instance(services_mapping) }

      it 'finds and returns service' do
        expect(subject.lookup('service_name')).to eq(dummy_class)
      end
    end

    context 'when requested service does not exists' do
      subject { described_class.instance({}) }
      it 'returns UnknonwService' do
        expect(subject.lookup('non existing')).to eq(DB::UnknownService)
      end
    end
  end
end
