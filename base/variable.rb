=begin
变量分类：局部变量(字母或下划线开头)
          全局变量(以$符号开头)
            实例变量(以@符号开头)
              类变量(以@@符号开头)
                伪变量(nil, true, false, self)
=end
$name = 'haha'
hobby = 'ruby'
require './variable_1'

p $name   #Ricky
p hobby   #ruby

CONST = 3.1415926  # warning: already initialized constant CONS


CONST = 1.11
