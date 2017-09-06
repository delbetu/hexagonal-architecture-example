require_relative '../../../lib/db_port/dm_adapter'
require 'byebug'

describe DB::DMAdapter do
  describe '.connect' do
    it 'returns an instance of DMAdapter' do
      expect(described_class.connect).to be_a(DB::DMAdapter)
    end

    it 'configures a connection and connect to db' do
      allow(DataMapper).to receive(:setup)
      described_class.connect
      expect(DataMapper).to have_received(:setup)
    end
  end

  describe '#lookup' do
    context 'when requested service exists' do
      let(:dummy_class) { double('ServiceImplementation') }
      let(:services_mapping) do
        { 'service_name' => dummy_class }
      end
      subject { described_class.connect(services_mapping) }

      it 'finds and returns service' do
        expect(subject.lookup('service_name')).to eq(dummy_class)
      end
    end

    context 'when requested service does not exists' do
      subject { described_class.connect({}) }
      it 'returns UnknonwService' do
        expect(subject.lookup('non existing')).to eq(DB::UnknownService)
      end
    end
  end

  describe '#update_schema' do
    subject { described_class.connect({}) }

    it 'updates tables with changes from schema' do
      expect(DataMapper).to receive(:auto_upgrade!)
      subject.update_schema
    end
  end

  describe '#create_schema' do
    subject { described_class.connect({}) }
    it 'destroy current tables with data and creates a new one' do
      expect(DataMapper).to receive(:auto_migrate!)
      subject.create_schema
    end
  end
end
