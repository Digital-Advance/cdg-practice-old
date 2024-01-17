require 'pry'
h = {}
arr = []
s = 0

def retry_method
    puts "Привет. Укажи количество покемонов которых ты хочешь добавить."
  loop do 
    @step = gets.chomp.to_i
      if @step == 0 
        puts "Ошибка ввода. Необходимо ввести количество покемонов больше 0. Повтори ввод:"
      end
    break if @step > 0 
  end
end

retry_method

def add_pockemons(h, arr, s)
  loop do
    puts "Введи имя покемона или 'q' для выхода из программы:"
      loop do
        @name = gets.chomp
      if @name.length == 0
        puts "Ошибка, пустой ввод. Повтори снова:"
      end
    break if @name.length > 0
  end
    
    puts "Введи цвет покемона:"
      loop do
        @color = gets.chomp
      if @color.length == 0
        puts "Ошибка, пустой ввод. Повтори снова:"
      end
    break if @color.length > 0
  end
    
    s += 1
    h = {name: @name, color: @color}
    arr.push(h)
    break if s == @step || @name == "q" || @name == "Q"
    #binding.pry
  end
end

add_pockemons(h, arr, s)

puts "Теперь посмотри кто у тебя в списке."
  arr.each do |name|
    #binding.pry
   puts "Имя покемона: #{name[:name]}. Цвет покемона: #{name[:color]}"
  end
puts "\nА так же в виде массива:#{arr}"
