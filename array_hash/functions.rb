# select
wanted_keys = %w[one two]
x = { one: 'one', two: 'two', three: 'three' }
y = x.select { |key, _| wanted_keys.include? key }
puts y