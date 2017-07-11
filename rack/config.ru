require './timing.rb'
require './test.rb'
require './ricky.rb'

use Timing
use Ricky
run Test

# rack_app = Timing.new(Ricky.new(App))