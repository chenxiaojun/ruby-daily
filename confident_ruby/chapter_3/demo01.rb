winners = [
    'Homestar',
    'King of Town',
    'Marzipan',
    'Strongbad'
]

Place = Struct.new(:index, :name, :prize) do
  def to_int
    index
  end
end

first = Place.new(0, 'first', "Peasant's Quest game")
second = Place.new(1, 'second', 'Limozeen Album')
third = Place.new(2, 'third', "Butter-da")

[first, second, third].each do |place|
  puts "In #{place.name} place, #{winners[place.index]}!"
  puts "You win: #{place.prize}!"
end

p second
p winners[second]