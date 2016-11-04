#``可以将命令标准输出，并将其转换为字符串对象。
# puts `cat /etc/hosts`


#printf 可以按照某种格式 输出字符串
number = 123
printf("%d\n", number)
printf("%4d\n", number)
printf("%04d\n", number)
printf("%+d\n", number)
#第一个参数决定输出的格式  %d表示已整数的形式输出    %4表示输出的长度4位，不足前面用空格补上
#%04d表示长度4位，不足用0补上   %+d表示输出的结果一定包含+


#类似的
printf("Hello, %s\n", 'Ruby')
printf("Hello, %8s\n", 'Ruby')
printf("Hello, %-8s\n", 'Ruby')


p sprintf("%s", 'PHP')

#sprintf 区别于 printf  在于sprintf会将里面的内容格式化为一个字符串对象  printf会格式化内容，但不转化为对象，而且会输出。