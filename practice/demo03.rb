# input = ['NORTH', 'SOUTH', 'SOUTH', 'EAST', 'WEST', 'NORTH', 'WEST']
# directions = []
#
# opposites = {
#   NORTH: 'SOUTH',
#   SOUTH: 'NORTH',
#   EAST: 'WEST',
#   WEST: 'EAST'
# }
#
# input.each do |dir|
#   p opposites[:"#{dir}"]
#   opposites[dir] == directions.last ? directions.pop : directions << dir
# end
#
# p directions



input      = ["NORTH", "NORTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
directions = []

opposites = {
    "NORTH" => "SOUTH",
    "SOUTH" => "NORTH",
    "EAST"  => "WEST",
    "WEST"  => "EAST"
}

input.each do |dir|
  # p opposites[dir]
  opposites[dir] == directions.last ? directions.pop : directions << dir
  # p directions
end

p directions