require 'date'    #引入某个类库

p Date.today

days = Date.today - Date.new(2015, 10, 3)
puts days.to_i