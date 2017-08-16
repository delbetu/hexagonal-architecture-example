require 'data_mapper'
require 'dm-migrations'
require_relative 'rate_persistor'

# Declares table structure
class TableRate
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :value, Decimal, scale: 5
  property :created_at, DateTime, default: DateTime.now
end
DataMapper.finalize
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')
# DataMapper.auto_migrate! # Wipe out data
DataMapper.auto_upgrade! # Preserve the data

# Calculates rate accessing a in-memory database implementation
class RatePersistorInMemory
  include RatePersistor

  def initialize
    configure_database
  end

  def rate
    TableRate.last.value
  end

  private

  def configure_database
    TableRate.raise_on_save_failure = true
  end
end
