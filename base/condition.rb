#条件控制语句
gender = "boys"

gender = 
  case gender
  when "boy"  then 1
  when "girl" then 2
  else "未知"
  end

if gender==1
  p "He is a boy"
elsif gender == 2
  p "She is a girl"
else
  p "I don't know"
end

p "He is a boy" if gender == 1
p "She is a girl" if gender == 2
p "I don't know" unless gender == 1 && gender ==2


