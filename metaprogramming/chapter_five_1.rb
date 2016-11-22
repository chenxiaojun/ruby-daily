 class MyClass
   puts 'Hello'
 end
 #会打印出Hello

 class Test
   def t1
     def t2
       p 'haha'
     end
     p 'hehe'
   end
 end

t = Test.new
t.t1
t.t2