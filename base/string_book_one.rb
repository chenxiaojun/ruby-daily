str = %Q{Ruby 的字符串中也可以使用''和""}
str2 = %q{Ruby 的字符串中也可以使用''和""}

#使用%Q定义的字符串相当于""定义的字符串
#使用%q定义的字符串相当于''定义的字符串
puts str
puts str2


puts <<EOB
haha
  hehe
EOB

puts <<-EOB
bushib
  bab
  EOB

# << 和  <<-  都是块开始的标记  区别在于<<的块结束符必须在行首    <<-开始的，结束符号不一定在行首
#此外<<EOB <<-EOB  默认是 <<"EOB"  <<-"EOB" 里面包含的块可以转义    <<'EOB'则不可以

