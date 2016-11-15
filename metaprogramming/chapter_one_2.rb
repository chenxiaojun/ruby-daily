require 'active_record'

ActiveRecord::Base.establish_connection({
    adapter:'mysql2',
    host:'127.0.0.1',
    username:'root',
    password:'123456',
    database:'demo',
    timeout:10,
    port:3306
})


class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = 'test'
movie.save

