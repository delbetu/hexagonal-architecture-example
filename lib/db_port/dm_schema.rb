module DB
  # contains declaration for all tables and relations within the database
  module DMSchema
    # Represents the rate table
    class Rate
      include DataMapper::Resource

      property :id, Serial
      property :description, Text
      property :value, Decimal, scale: 5
      property :created_at, DateTime, default: DateTime.now
    end
    DataMapper.finalize
  end
end
