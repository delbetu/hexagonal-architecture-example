module DB
  # Provides datamapper access for rate calculation use case
  class Rater
    def initialize(rate_table)
      @rate_table = rate_table
    end

    def rate
      @rate_table.last.value
    end
  end
end
