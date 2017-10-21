require './lib/use_cases'
require './lib/db_port'
require 'byebug'

# Main builds all objects needed by App
# The code within App runs assuming that objects are instantiated.

# Configure the app (build objects and cable them)
db_adapter = DB.build(DB::DATAMAPPER_PG)
DB.load_fake_data
db_rater = db_adapter.lookup('rater').new
uc = UseCase::RateCalculation.new(persistor: db_rater)

# Run the app
puts uc.execute(3)
