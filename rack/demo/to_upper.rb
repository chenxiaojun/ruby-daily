class ToUpper
  def initialize(app)
    @app = app
  end

  def call(env)
    status, head, body = @app.call(env)
    upcased_body = body.map{ |chunk| chunk.upcase }
    [status, head, upcased_body]
  end
end