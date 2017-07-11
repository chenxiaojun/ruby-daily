require './hello.rb'
require './timing.rb'
require './hi.rb'

use(Timing, pid: true) { puts 'Timing is being initialized' }
use(Hi) { puts 'Hi, Ricky!' }
run Hello