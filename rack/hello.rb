# Ruby Rack是一个接口，用于Ruby Web应用与应用服务器之间的交互
# 1. User Agent 发送 Http Request 到 Rack Server
# 2. Rack Server 中到Rack app call 应用程序
# 3. 应用程序返回response给Rack Server
# 4. Rack Server返回Http Response给User Agent

# app = proc do |env|
#   ['200', { 'Content-Type' => 'text/html' }, ['hello, Rack!']]
# end

# app 是一个能响应call方法到对象，任何类型对象都可以
# 接受一个hash格式到参数串
# 返回一个三个元素到数组
  # 1. HTTP应答代码
  # 2. 一个Hash类型到对象，包含HTTP应答头部信息
  # 3. 一个响应each方法到对象，其结果可作为HTTP应答消息到主体

require 'rack'

app = proc do |env|
  ['200', { 'Content-Type' => 'text/html' }, ['hello, Rack!']]
end

Rack::Handler::WEBrick.run(app, Port: 8090, Host: 'localhost')
