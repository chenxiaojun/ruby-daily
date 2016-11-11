def test(key, value, options, options2 = {}, &block)
  p key #"Hello"
  p value #"World"
  p options #{:hobby=>"computer", :name=>"ricky"}
  p '-----'
  p options2 #{}
  p block ##<Proc:0x007f9d298dfe00@arguments.rb:10>
end

test('Hello', 'World', hobby:'computer', name:'ricky'){ |x| x + 1 }
test('Hello', 'World', {hobby:'computer', name:'ricky'}){|y| y + 1}  #和上面是一样的


def demo(key, value, *args, &block)
  p key #"Hello"
  p value #"World"
  p args        #[{:hobby=>"computer", :name=>"ricky"}]
  p block
end

demo('Hello', 'World', hobby:'computer', name:'ricky'){ |x| x + 1 }


#当hash作为参数时， 只有在最后一个参数的位置传入时不会出错， 并且会将若干hash看成一个元素。

def error_test(key, options, value)
  p key
  p options
  p value
end

ok_test('hello', {hobby:'computer', name:'ricky'}, 'world') #ok   这种需要使用花括号带起来
#error_test('hello', hobby:'computer', name:'ricky', 'world') #error