#可以在正则表达式  后面携带参数  i->忽略大小写    m->匹配多行   x->忽略空白字符
reg1 = /abc/
reg2 = /abc/i

p reg1 =~ 'ABCD'   #nil
p reg2 =~ 'ABCD'   #0

#在正则表达式中  我们使用()建立子模式，然后可以通过$数字进行捕获(后向引用)
/^\w+\s*(\w+)\s*(\w+)/ =~ "I love you"
p $1  #love
p $2  #you

#但有时 如果我们改变了匹配中()的数量，会导致引用部分索引变化
#假设我们不希望发生这种情况，我们可以把后加的索引  使用 ?:  告知不捕获
/^\w+\s*(\w+)(\s*)(\w+)/ =~ "I love you"
p $2



/^\w+\s*(\w+)(?:\s*)(\w+)/ =~ "I love you"
p $2



# $`表示匹配的元素前面的部分     $&表示匹配到的结果       $'表示匹配到的结果后面的字符串
/ov/ =~ 'I love you'
p $` # I l
p $& # ov
p $' # e you


#sub  gsub   作用： 用指定的字符 置换 字符串中的某部分字符
#sub, gsub都有两个参数， 第一个是正则表达式模式   第二个用于指定 与 匹配部分  置换的字符
#sub只置换首次匹配的部分      gsub则会置换所有匹配的部分
str = "abc def g hi"
p str.sub(/\s+/, '|')
p str.gsub!(/\s+/, '|')
p str


#sub gsub还可以使用块处理   它们会将匹配到的传递到块里，然后快里面处理完的结果作为替换变量
str = 'afbfkkkcfllldf'
new_str = str.sub(/.f/) do |matched|
  '<' + matched.upcase + '>'
end
p new_str

str.gsub!(/.f/) do |matched|
  '<' + matched.upcase + '>'
end
p str


#当我们仅仅想对匹配的部分做某种处理时  可以使用scan
#scan不会去改写匹配的部分    仅仅是对匹配的部分进行下一步处理
container = []
'afbfsdsdasfsadasdf'.scan(/.f/) do |matched|
  container << matched
end
p container

#如果后面没有指定 需要怎么处理的块   会返回匹配到的数组
p 'afbfsdsdasfsadasdf'.scan(/.f/)

#如果模式里面有子模式 那么块里面将会接受到的是所有子模式匹配的数组
'afbfsdsdasfsadasdf'.scan(/(.f)\w+(.s)/) do |mat|
  p mat
end


#phpgeek@qq.com

str = 'rickycxj@gmail.com'
pattern = /([\w\d]+)\@([\w\d\-]+\.\w*)/
p str =~ pattern
p $1
p $2

p "正则表达式真难啊，怎么这么难懂!".gsub(/真难/, '真简单').gsub(/难懂/, '易懂')


def word_capitalize(param)
  p param.split(/-/).collect{|x| x.capitalize}.join('-')
end


word_capitalize('in-reply-to')








