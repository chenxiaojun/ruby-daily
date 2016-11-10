#写入数据到csv文件
require 'csv'
require_relative './helpers'

File.delete('data.csv') if File.exist?('data.csv')

headers = ['编号', '姓名', '邮箱', '城市']

name = 'Ricky'
email = 'rickycxj@gmail.com'
city = 'Shenzhen'

print_memory_usage do
  print_time_spent do
    CSV.open('data.csv', 'w', write_headers: true, headers: headers) do |csv|
      4.times do |i|
        csv << [i, name, email, city]
      end
    end
  end
end