require 'rack'
require './timing.rb'

app = proc do |env|
  ['200', { 'Content-Type' => 'text/html' }, ['hello, Rack!']]
end

# Race中间件就是一个类，如上面的Timing，其对象响应一个call方法，这个方法的输入,输出与一般的Rack应用一样。
# 因此Timing.new(app) 可以作为一个Rack应用直接传递给Rack::Handler::WEBrick.run
# 实际上，中间件可以这样一层一层地层层嵌套下去，最后得出一个可以call的Rack应用

Rack::Handler::WEBrick.run(Timing.new(app), Port: 8080, Host: 'localhost')