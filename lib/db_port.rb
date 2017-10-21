require_relative 'db_port/dm_adapter'

# provides different kinds of adapters
module DB
  DATAMAPPER_PG = 1
  class NoAdapterFound < StandardError; end

  def self.build(adapter_key)
    case adapter_key
    when DATAMAPPER_PG
      DMAdapter.connect
    else
      raise NoAdapterFound, adapter_key
    end
  end

  def self.load_fake_data
    DB::DMSchema::Rate.create(description: 'Sample rate', value: 1.5) # add data
  end
end
