# respond_to? & send
# if the method is not exist, respond_to? will return false
obj = Object.new
if obj.respond_to? :talk
  obj.talk
else
  puts "Sorry, object can't talk"
end

