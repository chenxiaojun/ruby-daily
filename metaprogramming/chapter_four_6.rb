#领域专属语言
def event(description)
  puts "ALERT: #{description}" if yield
end

event "an event that always happens" do
  true
end

event "an event that nerver happens" do
  false
end