require 'mysql2'

#连接mysql
client = Mysql2::Client.new(
  host: '127.0.0.1',
  port: 3306,
  username: 'root',
  password: '123456'
)

result = client.query("SELECT VERSION()")

result.each do |row|
  puts row
end

# resource = client.query("create database demo")

client.query("use demo")

client.query("create table haha(id int primary key auto_increment)")