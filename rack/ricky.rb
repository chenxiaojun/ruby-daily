class Ricky
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    puts "Ricky's Test"
    [status, headers, body]
  end
end