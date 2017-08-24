require_relative 'db_port/dm_adapter'

# provides different kinds of adapters
module DB
  def self.build
    DMAdapter.instance
  end
end
