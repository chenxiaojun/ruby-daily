def pretty_int(value)
  decimal = Integer(value).to_s
  p decimal
  leader = decimal.slice!(0, decimal.length % 3)
  p leader
  decimal.gsub!(/\d{3}(?!$)/, '\0,')
  p decimal
  decimal = nil if decimal.empty?
  leader = nil if leader.empty?
  p [leader, decimal].compact.join(",")
end

pretty_int(1000)
p '------'
pretty_int(23)
p '------'
pretty_int(4567.8)
p '------'
pretty_int(0xCAFE)
p '------'
pretty_int(Time.now)


people = ['ricky', 12, 'micky', 13]
p Hash[*people]