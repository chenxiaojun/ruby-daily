arr1 = [1, 3, 5]
arr2 = [2, 5, 8]

arr3 = arr1 + arr2
p arr3 #[1, 3, 5, 2, 5, 8]


arr4 = [1, 3, 5]
arr5 = [2, 5, 8]

p arr4.concat(arr5)#[1, 3, 5, 2, 5, 8]
p arr4##[1, 3, 5, 2, 5, 8]


arr6 = [1, 3, 5]
arr7 = [2, 5, 8]
p arr6 << arr7 #[1, 3, 5, [2, 5, 8]]
p arr6 #[1, 3, 5, [2, 5, 8]]



arr8 = [1, 3, 5]
arr9 = [2, 5, 8]
p arr8 | arr9  #[1, 3, 5, 2, 8]
p arr8 #[1, 3, 5]


#所以 +  和 concat都可以用来合并两个数组不去重复
#    |  可以合并两个数组  去重复  取并集
#    <<  向数组里面追加一个内容


arr10 = [1, 3, 5]
arr11 = [2, 5, 8]

arr12 = arr10 & arr11 #[5]
arr13 = arr10 - arr11 #[1, 3]
p arr12
p arr13

