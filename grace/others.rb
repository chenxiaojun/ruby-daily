p [*'a'..'z']   #创建从a-z的数组
p [*?a..?z]


class Integer
  def to_proc
    ->(arr) { arr[self] }
  end
end
arr = [[*3..7],[*14..27],[*?a..?z]]
p arr.map &4
