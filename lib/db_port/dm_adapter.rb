require 'data_mapper'
require_relative 'dm_adapter/rater'
require_relative 'dm_schema'

module DB
  UnknownService = Class.new

  # Provides objects with datamapper implementations for different operations
  class DMAdapter
    include DMSchema

    def self.connect(
      services_mapping = default_services_mapping,
      config = default_config
    )
      connection_string =
        "#{config['adapter_name']}://#{config['db_user']}"\
        "@#{config['host']}/#{config['db_name']}"

      DataMapper.setup(
        :default,
        connection_string
      )

      new(services_mapping)
    end

    def update_schema
      DataMapper.auto_upgrade!
    end

    def create_schema
      DataMapper.auto_migrate!
    end

    def lookup(service_name)
      @services_mapping[service_name] || ::DB::UnknownService
    end

    def initialize(services_mapping)
      @services_mapping = services_mapping
    end
    private_class_method :new

    def self.default_services_mapping
      {
        'rater' => Rater
      }
    end
    private_class_method :default_services_mapping

    def self.default_config
      # TODO: Load config from yaml file
      {
        'adapter_name' =>  'postgres',
        'db_user' =>  'hexagonal_usr',
        'host' =>  'localhost',
        'db_name' =>  'hexagonal_db_development'
      }
    end
    private_class_method :default_config
  end
end
