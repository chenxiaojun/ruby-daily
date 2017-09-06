# select
wanted_keys = %w[one two]
x = { one: 'one', two: 'two', three: 'three' }
y = x.select { |key, _| p wanted_keys.include? key.to_s }
puts y