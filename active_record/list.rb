require 'active_record'
1000.times {f=File.new('list.txt', 'a'); sid = SecureRandom.hex(4); f.puts sid if sid !~ /0|o/ }

