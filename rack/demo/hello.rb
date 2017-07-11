class Hello
  def initialize
    super
  end

  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ["hello, this is a test"]]
  end
end