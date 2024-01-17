puts "Введите первое число"
  a = gets.chomp.to_i
puts "Введите второе число"
  b = gets.chomp.to_i

sum = a + b

  def foobar(a, b, sum)
    if a == 20
      return "Второе число равно #{b}"
    elsif b == 20
      return "Первое число равно #{a}"
    else 
      return "Сумма двух чисел равна #{sum}"
    end
  end

puts foobar(a, b, sum)
