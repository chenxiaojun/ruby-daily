class Hello
  def initialize
    super
  end

  def get_request
    @request ||= Rack::Request.new(@env)
  end

  def response(text, status=200, head={})
    raise "response" if @response
    text = [text].flatten
    @response = Rack::Response.new(text, status, head)
  end

  def get_response
    @response || response([])
  end

  %W(get? put? post? delete? patch? trace?).each do |md|
    define_method md do
      get_request.send(md.intern)
    end
  end

  %W{body headers length= status=  body= header length
       redirect status content_length content_type}.each do |md|
    define_method md do |*arg|
      get_response.send(md.intern, *arg)
    end
  end

  def call(env)
    @env = env
    content_type   = 'text/plain'
    if get?
      status = 200
      body= ['you send a get request']
    else
      status= 403
      body= ['we do not support request method except get, please try another.']
    end
    [status, headers, body]
  end
end