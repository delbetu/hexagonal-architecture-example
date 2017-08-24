require_relative 'dm_adapter/rater'

module DB
  UnknownService = Class.new

  # Provides objects with datamapper implementations for different operations
  class DMAdapter
    def self.default_services_mapping
      {
        'rater' => Rater
      }
    end

    def self.instance(services_mapping = default_services_mapping)
      new(services_mapping)
    end

    def initialize(services_mapping)
      @services_mapping = services_mapping
    end

    def lookup(service_name)
      @services_mapping[service_name] || ::DB::UnknownService
    end

    private_class_method :new
    private_class_method :default_services_mapping
  end
end
