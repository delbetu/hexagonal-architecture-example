module UseCase
  # Represents process of rate calculation
  class RateCalculation
    def initialize(persistor:)
      @persistor = persistor
    end

    def execute(request)
      (request * persistor.rate).round(5)
    end

    private

    attr_reader :persistor
  end
end
