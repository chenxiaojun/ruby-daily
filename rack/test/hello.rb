class Hello
  def self.call(env)
    [200, {'Content-Type' => 'text/html'}, ['Hello, Ricky!']]
  end
end