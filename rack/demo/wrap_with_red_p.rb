class WrapWithRedP
  def initialize(app)
    @app = app
  end

  def call(env)
    status, head, body = @app.call(env)
    red_body = body.map{ |chunk| "<p style='color:red;'>#{chunk}</p>" }
    head['Content-type'] = 'text/html'
    [status, head, red_body]
  end
end