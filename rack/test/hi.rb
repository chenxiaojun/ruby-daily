class Hi
  def initialize(app, &block)
    @app = app
    puts 'In hi middleware'
    yield if block_given?
  end

  def call(env)
    # status, headers, body = @app.call(env)
    # [status, headers, body]
    puts 'abc'
    [200, {'Content-Type' => 'text/html'}, ['haha']]
  end
end