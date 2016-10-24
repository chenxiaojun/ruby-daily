#在ruby中 返回真假值的方法 都以 ? 结尾
def is_male?
  if ARGV[0] == "1"
    true
  else
    false
  end
end

p 'yes' if is_male?
p 'no'  unless is_male?