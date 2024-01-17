require 'pry'

CAR_LIST = 'list.txt'
BUFFER = 'buffer.txt'

puts "\nФайл успешно загружен. Для получения списка автомобилей нажми 'Enter'.".rjust(146, "_")
  gets.chomp

def index
  puts "\nАвтомобили в списке:\n".center(172, "=")
    file = File.open(CAR_LIST)
      @arr = file.readlines.map { |x| x.chomp }
    File.foreach(CAR_LIST) { |car| puts "> #{car}" }
end

puts "#{index}"

loop do
  puts "\nВыбери необходимую функцию:\n".center(179, "=")
    print">1 - Добавить автомобиль в конец списка.\n>2 - Заменить автомобиль в списке.\n>3 - Удалить автомобиль из списка по ID.\n>4 - Завершить программу.\nВвод >> "
    function = gets.chomp.to_i

  if function == 4
    abort "\nПрограмма завершена\n".center(171, "=")

  elsif function == 1
    def add_list
      print "\nВведи модель автомобиля >> ".rjust(103, "-")
        add_car = gets.chomp
      File.write(CAR_LIST, "#{add_car}\n", mode: "a")
      puts "\nАвтомобиль добавлен. Список обновлен:\n".center(189, "=")
      File.foreach(CAR_LIST) { |car| puts "> #{car}" }
    end
    puts add_list
  
  elsif function == 3
    loop do
      print "\nВведи модель автомобиля для поиска ID:\nВвод >> ".rjust(123, "-")
        model = gets.chomp
        @car_id = (0 ... @arr.length).find_all { |i| @arr[i] == model }
          print "\nID автомобиля в списке = #{@car_id}\n>1 - Удалить.\n>2 - Повторить поиск.\nВвод >> ".rjust(149, "-")
            delete_method = gets.chomp.to_i
      break if delete_method == 1
    end

    print "\nВведи ID автомобиля для удаления >> ".rjust(112, "-")
      id_delete = gets.chomp.to_i
      @arr.slice!(id_delete)
      string = @arr.join("\n")
      def delete(id_delete, string)
        file = File.open(BUFFER, "w")
          file.write ("#{string}\n")
            file.close

          File.write(CAR_LIST, File.read(BUFFER))
          File.delete(BUFFER) if File.exist?(BUFFER)
        puts "\nАвтомобиль удален. В списке осталось:\n".center(189, "=")
        File.foreach(CAR_LIST) { |car| puts "> #{car}" }
        end
      delete(id_delete, string)
    end

  break if function == 2
end

puts "\nДля замены автомобиля в списке можно выполнить его поиск по id  или модели.\n".center(227, "-")
print "Выбери способ поиска:\n>1 - ID.\n>2 - Модель.\nВвод >> "
  method = gets.chomp

if method == "1"
  loop do
    print "\nВведи ID для отображения модели >> ".rjust(111, "-")
      @id = gets.chomp.to_i

    def find
      File.readlines(CAR_LIST)[@id]
    end
    print "\nПод номером #{@id} записан автомобиль - #{find}>1 - Заменить.\n>2 - Повторить поиск.\nВвод >> ".rjust(160, "-")
      find_method = gets.chomp.to_i
    break if find_method == 1
  end
    update_id = @id
  print "\nДля замены введи новую модель автомобиля >> ".rjust(120, "-")
    update_model = gets.chomp

elsif method == "2"
  loop do
    print "\nВведи модель для отображения ID >> ".rjust(111, "-")
      model = gets.chomp

    def where(model)
      @car_id = (0 ... @arr.length).find_all { |i| @arr[i] == model }
      #@line_id = @car_id.join (",")
    print "\nID автомобиля в списке = #{@car_id}\n>1 - Заменить.\n>2 - Повторить поиск.\nВвод >> ".rjust(148, "-")
    end
    print "#{where(model)}"
      find_method1 = gets.chomp.to_i
  break if find_method1 == 1
end
print "\nДля замены автомобиля в списке укажи его ID >> ".rjust(123, "-")
  update_id = gets.chomp.to_i
print "\nТеперь укажи новую модель автомобиля >> ".rjust(116, "-")
  update_model = gets.chomp
end

def update(update_id, update_model)
  file = File.open(BUFFER, "w")
  File.foreach(CAR_LIST).with_index do |car, index|
    file.puts(update_id == index ? update_model : car)
  #binding.pry
  end

  file.close
  File.write(CAR_LIST, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

  update(update_id, update_model)

def update_index
  puts "\nСписок обновлен:\n".center(168, "=")
    File.foreach(CAR_LIST) { |car| puts "> #{car}" }
end

update_index

puts "\nПрограмма завершена\n".center(171, "=")
