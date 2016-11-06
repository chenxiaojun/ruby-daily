def do_work(filename)
  lines = nword = chars = 0
  words = []
  File.open(filename) do |io|
    p io.each
    p io.each_line
    io.each do |line|
        lines += 1
        line.split(/\s+/).reject{|contents| words << contents unless contents.empty?}
        # p line.chomp.split(/\s+/)
        # p line.chomp.split(/\s+/).length
        #  nword += line.chomp.split(/\s+/).size  #有问题的   因为如果一个单词前面太片空白，会变成数组一个元素
        nword += line.split(/\s+/).reject{|contents| contents.empty?}.length
        chars += line.size
    end
  end
  [lines, nword, chars, words]
end

# result = do_work('log.txt')
# p result
# p result[3].length


# def reverse_file(filename)
#   File.open(filename, 'r+') do |f|
#     #读取文件所有行
#     lines = f.readlines
#     p lines
#     p lines.reverse
#     f.rewind
#     f.truncate(0)
#     f.write lines.reverse.join()
#   end
# end
#
# reverse_file('log.txt')


# def store_first_line(filename)
#   File.open(filename, 'r+') do |f|
#     contents = f.readlines
#     f.rewind
#     f.truncate(0)
#     f.write contents.last
#   end
# end
#
# store_first_line('log.txt')

def my_tail(lnumber, file)
  queue = Array.new
  File.open(file) do |f|
    #解法一
    # while(line = f.gets)
    #   queue.push(line)
    #   if queue.size > lnumber.to_i
    #     queue.shift
    #   end
    # end
    #解法二
    f.readlines.reverse.each_with_index { |val, key| queue << val if key < 3}
  end
  queue.each{|l| p l.chomp}
end

my_tail(ARGV[0], ARGV[1])
