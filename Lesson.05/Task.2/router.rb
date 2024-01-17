require 'pry'
ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

module Resource
  def connection(routes)
    if routes.nil?
      puts "Нет совпадений маршрута для #{self}"
      return
    end

    loop do
      
      print "\nВыберите действие для взаимодействия с ресурсами (1 - GET. 2 - POST. 3 - PUT. 4 - DELETE) / q для выхода: "
      interaction_number = ["1", "2", "3", "4", "q"]
        verb = gets.chomp
        break if verb == 'q'

        if ALPHABET.include?(verb)
          puts "\nВы ввели букву, для выбора ресурса необходимо ввести цифру\n".center(242, "==")
        elsif ! interaction_number.include?(verb)
          puts "\nТакой комманды не существует. Выберите 1, 2, 3, 4 или q для выхода.\n".center(251, "==")
        end

      action = nil

      if verb == '1'
        
          print "\nВыберите действие (1 - Показать все посты с индексом. 2 - Показать пост по индексу) / q для выхода: "
            action_number = ["1", "2", "q"]
              action = gets.chomp
          break if action == 'q'
          puts "\nТакой комманды не существует. Повторите заново.\n".center(251, "==") if ! action_number.include?(action)
          end
        
        if interaction_number.include?(verb) && action.nil? == true
          routes[verb].call
        elsif interaction_number.include?(verb) && action_number.include?(action) && action.nil? == false
          routes[verb][action].call    
        end
    end
  end
end

class PostsController
  extend Resource

  def index
    file = File.open('db.txt')
      file.each_with_index do |post, index|
      puts "#{index} - #{post}"
    end
  end

  def show
    loop do
    print "\nВведите индекс для отображения поста или 'q' для выхода: "
    file = File.open('db.txt')
      posts = file.readlines.map { |x| x.chomp }
        find_index = gets.chomp
          index_list = []
      posts.each_with_index {|post, index| index_list.push(index.to_s)}

        break if find_index == "q"

      if index_list.include?(find_index)
        puts "\n#{posts[find_index.to_i]}"
      elsif ALPHABET.include?(find_index)
        puts "\nВы ввели букву, для отображения поста необходимо ввести цифру.\n".center(250, "==")
      elsif ! index_list.include?(find_index)
        puts "\nПоста с таким индексом не существует. Повторите ввод.\n".center(241, "==")
      end
    end
  end

  def create
    print "\nВведите текст поста: >> "
      text = gets.chomp
        File.write('db.txt', "#{text}\n", mode: "a")
          file = File.open('db.txt')
        show_id = file.readlines.map { |x| x.chomp }
      id = show_id.index(text)
    puts "\nПод индексом #{id} записан пост #{text} "
  end

  def update
    data = File.open('db.txt')
      posts_id = data.readlines.map { |x| x.chomp }
        index_list_update = []
      posts_id.each_with_index {|post, index| index_list_update.push(index.to_s)}

        print "\nДля замены поста укажите его ID: "

        update_id = gets.chomp

        if ALPHABET.include?(update_id)
          puts "\nВы ввели букву, для отображения поста необходимо ввести цифру.\n".center(238, "==")
        elsif ! index_list_update.include?(update_id) 
          puts "\nПоста с таким индексом не существует. Проверьте существующие посты и повторите заново.\n".center(262, "==")
        elsif index_list_update.include?(update_id)
          print "\nВведите новый текст поста: >> "
            
          update_post = gets.chomp
        
    file = File.open('buffer.txt', "w")
    File.foreach('db.txt').with_index do |post, index|
      file.puts(update_id.to_i == index ? update_post : post)
    end
  
    file.close
    File.write('db.txt', File.read('buffer.txt'))
    File.delete('buffer.txt') if File.exist?('buffer.txt')

    file = File.open('db.txt')
      show_id = file.readlines.map { |x| x.chomp }
        id = show_id.index(update_post)
    puts "\nПод индексом #{id} записан пост #{update_post} "
    end
  end

  def destroy
    print "\nДля удаления поста укажите его ID: >> "

      delete_id = gets.chomp

      file = File.open('db.txt')
        array_post = file.readlines.map { |x| x.chomp }
          destroy_post_name = array_post[delete_id.to_i]
            index_list_destroy = []
          array_post.each_with_index {|post, index| index_list_destroy.push(index.to_s)}


      if ALPHABET.include?(delete_id)
        puts "\nВы ввели букву, для отображения поста необходимо ввести цифру.\n".center(238, "==")
      elsif ! index_list_destroy.include?(delete_id)
        puts "\nПоста с таким индексом не существует. Проверьте существующие посты и повторите заново.\n".center(262, "==")
      elsif index_list_destroy.include?(delete_id)
        array_post.slice!(delete_id.to_i)
          string = array_post.join("\n")
      
        buffer = File.open('buffer.txt', "w")
          buffer.write ("#{string}\n")
            buffer.close

          File.write('db.txt', File.read('buffer.txt'))
          File.delete('buffer.txt') if File.exist?('buffer.txt')
    
        puts "\nПод индексом #{delete_id} удален пост #{destroy_post_name} "
      end
  end
end

class Router

  def initialize
    @routes = {}
  end

  def init

    resources(PostsController, 'posts')

    loop do
      print "\nВыберите ресурс, с которым хотите взаимодействовать (1 - Посты, 2 - Комментарии, q - Выход): "
      resources_number = ["1", "2", "q"]

      choise = gets.chomp

      if ALPHABET.include?(choise)
        puts "\nВы ввели букву, для выбора ресурса необходимо ввести цифру\n".center(248, "==")
      elsif choise == "2"
        puts "\nВ данный момент работа с комментариями недоступна, можно выбрать только работу с постами.\n".center(279, "==")
      elsif ! resources_number.include?(choise)
        puts "\nТакой комманды не существует. Выберите 1, 2 или q для выхода.\n".center(251, "==")
      end

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts "Досвидания!".center(94, "--")
  end

  def resources(klass, keyword)
    controller = klass.new

    @routes[keyword] = {
      '1' => {
        '1' => controller.method(:index),
        '2' => controller.method(:show)
      },
      '2' => controller.method(:create),
      '3' => controller.method(:update),
      '4' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
