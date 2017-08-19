require 'data_mapper'

class TableRate
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :value, Decimal, scale: 5
  property :created_at, DateTime, default: DateTime.now
end
DataMapper.finalize
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(
  :default,
  'postgres://hexagonal_usr:@localhost/hexagonal_db_development'
)

DataMapper.auto_upgrade! # Preserve the data
