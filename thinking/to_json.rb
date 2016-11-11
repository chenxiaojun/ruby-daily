require 'json'  #需先gem install json     然后再引入这个包    就可以将一个数组或hash转变成json对象

test = ['red', 'blue', 'silver']
p test.to_json
p test.to_json.class #String

demo = {name:'ricky', age:23}
p demo.to_json
p demo.to_json.class #String


test_2 = JSON.parse(test.to_json)    #将string对象转化为json
demo_2 = JSON.parse(demo.to_json)

p test_2
p demo_2
