require 'rack'
Rack::Handler::Thin.run Rack::Directory.new('./'), :Port => 9292