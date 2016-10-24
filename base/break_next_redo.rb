puts 'break的例子: '
i = 4
['Perl', 'Python', 'Ruby', 'Scheme'].each do |lang|
  if i <= 3
    break  #break会终止当前的循环
  end
  p [i, lang]
  i -= 1
end

puts 'next的例子'
i = 0
['Perl', 'Python', 'Ruby', 'Schema'].each do |lang|
  i += 1
  if i != 3
    next
  end
  p [i, lang]
end

puts 'redo的例子'
i = 0
['Perl', 'Python', 'Ruby', 'Schema'].each do |lang|
  i += 1
  if i == 3
    redo
  end
  p [i, lang]
end