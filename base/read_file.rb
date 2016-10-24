=begin
读取文件
1, 打开文件
2，读取文件内容
3，输出文件内容
4，关闭文件
=end

# filename = ARGV[0]
# file = File.open(filename)
# text = file.read
# print text
# file.close


# 如果仅仅是读取文件内容  可以省略打开这一步骤
# print File.read(ARGV[0])

#上述这种会一下子读取全部文件内容，然后保存到内存中。  一来很耗时，二来容易造成程序奔溃。
# filename = ARGV[0]
# file = File.open(filename)
# file.each_line do |item|     #这种逐行读取比较好
#   print item
# end
# file.close

filename = ARGV[0]
pattern = Regexp.new(ARGV[1])
file = File.open(filename)
file.each_line do |line|
  print pattern =~ line
end
print "\n"
file.close