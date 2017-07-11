class WrapWithHtml
  def initialize(app)
    @app = app
  end

  def call(env)
    status, head, body = @app.call(env)
    wrap_html = <<-EOF
      <!DOCTYPE html>
      <html>
        <head>
        <title>hello</title>
        <body>
          #{body[0]}
        </body>
      </html>
    EOF
    [status, head, [wrap_html]]
  end
end