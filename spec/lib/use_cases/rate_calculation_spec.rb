require_relative '../../../lib/use_cases/rate_calculation'

describe UseCase::RateCalculation do
  context 'when rate is 1.1 and user input 100' do
    let(:request) { 100.0 }
    let(:calculator) { UseCase::RateCalculation.new(persistor: persistor) }
    let(:persistor) { double(rate: 1.1) }

    it 'calculates formula input * rate' do
      response = calculator.execute(request)
      expect(persistor).to have_received(:rate)
      expect(response).to eq(110.0)
    end
  end

  context 'when input is nil'
  context 'when persistor raises an error'
  context 'when input is 0'
  context 'when rate is 0'
end
