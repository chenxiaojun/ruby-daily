require './demo02'

puts 'Hello'.reverse # 即使把demo02引入进来，refine的内容也只在它所在的脚本作用域生效

puts 'Hello'.test