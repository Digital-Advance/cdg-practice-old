require 'pry'

STUDENT_LIST = 'student_list.txt'
RESULTS = 'results.txt'
BUFFER = 'buffer.txt'

puts "\nФайл успешно загружен. Для получения списка студентов нажми 'Enter'.".rjust(146, "_")
  gets.chomp

def index
  puts "\nСтуденты в списке:\n".center(172, "=")
    file = File.open(STUDENT_LIST)
      @arr = file.readlines.map { |x| x.chomp }
    File.foreach(STUDENT_LIST) { |student| puts student }
end

puts "#{index}"

def select_function
  loop do
    print "\nВыбери необходимую функцию:\n".center(181, "=")
    print"\n> 1 - Добавить студента в конец списка.\n> 2 - Отсортировать студентов по возрасту.\n> 3 - Удалить студента из списка по ID.\n> 4 - Завершить программу.\nВвод >> "
    function = gets.chomp.to_i
    if function == 1
      def add_list
        print "\nВведи фамилию студента >> ".rjust(103, "-")
          add_surname = gets.chomp
        print "\nВведи имя студента >> ".rjust(99, "-")
          add_name = gets.chomp
        print "\nВведи отчество студента >> ".rjust(104, "-")
          add_patronymic = gets.chomp
        print "\nВведи возраст студента >> ".rjust(103, "-")
          add_age = gets.chomp
        add_student = "> #{add_surname} #{add_name} #{add_patronymic} | #{add_age}"
        File.write(STUDENT_LIST, "#{add_student}\n", mode: "a")
          puts "\nСтудент добавлен. Список обновлен:\n".center(188, "=")
        File.foreach(STUDENT_LIST) { |student| puts student }
      end
        add_list

    elsif function == 2
      def picking_student
        loop do
         print "\nВведи возраст для поиска всех студентов >> ".rjust(120, "-")
           age = gets.chomp
           @student_id = (0 ... @arr.length).find_all { |i| @arr[i].include? age }
            if @student_id == []
              abort "\nСтуденты с таким возрастом отсутствуют. Программа завершена.\n".center(214, "=")
            end
           print "\nID студентов c возрастом #{age} в списке = #{@student_id}\n>1 - Переместить в отдельный список.\n>2 - Повторить поиск.\nВвод >> ".rjust(188, "-")
         move_method = gets.chomp.to_i
         break if move_method == 1
        end 
        print "\nВведи ID студента для переноса в отдельный список >> ".rjust(130, "-")
          move_student = gets.chomp.to_i
          update_string = @arr [move_student]
          @arr.slice!(move_student)
          string = @arr.join("\n")
          file = File.open(BUFFER, "w")
          file.write ("#{string}\n")
            file.close

          File.write(STUDENT_LIST, File.read(BUFFER))
          File.delete(BUFFER) if File.exist?(BUFFER) 
          File.write(RESULTS, "#{update_string}\n", mode: "a")
          puts "\nСписок обновлен:\n".center(170, "=")
          File.foreach(STUDENT_LIST) { |student| puts student }
          print "\n> 1 - Посмотреть отдельный список.\n> 2 - Выйти в главное меню.\nВвод >> ".rjust(148, "-")
            show_results = gets.chomp.to_i
          if show_results == 1
            puts "\nОтдельный список:\n".center(170, "=")
            File.foreach(RESULTS) { |student| puts student }
          end
        end
        picking_student

    elsif function == 3
      def delete_student
        print "\nВведи фамилию студента которого необходимо удалить из списка >> ".rjust(141, "-")
          delete_surname = gets.chomp
        delete_id = (0 ... @arr.length).find_all {|i| @arr[i].include? delete_surname}
        print "\nID студента с фамилией #{delete_surname} = #{delete_id}\n> 1 - Удалить.\n> 2 - Отменить и выйти в главное меню.\nВвод >> ".rjust(177, "-")
          choise = gets.chomp.to_i

        if choise == 1
          print "\nВведи ID для удаления >> ".rjust(102, "-")
            id_deleted = gets.chomp.to_i
          @arr.slice!(id_deleted)
            delete_string = @arr.join("\n")
          file = File.open(BUFFER, "w")
          file.write ("#{delete_string}\n")
            file.close

          File.write(STUDENT_LIST, File.read(BUFFER))
          File.delete(BUFFER) if File.exist?(BUFFER)
            puts "Обновленный список:\n".ljust(96, "=")
          File.foreach(STUDENT_LIST) { |student| puts student }
        end
      end
      delete_student

    elsif function == 4
      abort "\nПрограмма завершена.\n".center(174, "=")
    end
  end
end

select_function