require 'pry'

BALANCE = 'balance.txt'
CARD_1 = 'card_1.txt'
CARD_2 = 'card_2.txt'
CARD_3 = 'card_3.txt'
@try = 0
card_list = [1, 2, 3]

def initialized
    file = File.open(@read_card)
      @arr = file.readlines.map { |x| x.chomp }
      @card_info = @arr[1..2]
      pin_card_info = @arr[0]
      @pin_card = pin_card_info[11..-1].to_i
      @card_info_string = @card_info.join("\n")
      @balance = @arr[4].to_f
      lock_info = @arr[6]
      @lock_check = lock_info[7..-1]

end

def lock_verification
  abort "\nВаша карта заблокирована, обратитесь в ближайшее отделение банка.\n".center(265, "~") if @lock_check == "true"
end

def start_system(card_list)
  print " Добро пожаловать в банкомат. ".center(99, "=") 
  loop do
    print "\n\nВ системе зарегистрировано 3 карты. Для работы с банковским счетом выберите одну из карт:\n>> 1. Карта 1.\n>> 2. Карта 2.\n>> 3. Карта 3.\nВвод >> "
      case choise_card = gets.chomp.to_i
    when 1
      @read_card = CARD_1
    when 2
      @read_card = CARD_2
    when 3
      @read_card = CARD_3
    else
    print "Такой карты не существует, повторите ввод:".center(97, "><")
    end
    break if card_list.include?(choise_card)
  end
end

def lock_card
  lock_card = "lock = true"
  buffer = File.open(BALANCE, "w")
  File.foreach(@read_card).with_index do |lock, index|
    buffer.puts(index == 6 ? lock_card : lock)
  end

  buffer.close
  File.write(@read_card, File.read(BALANCE))
  File.delete(BALANCE) if File.exist?(BALANCE)
end

def pin
  loop do
    print "\nPIN код >> "
      pin = gets.chomp.to_i
    if @pin_card == pin
      puts "Код принят.\n\n"
    elsif @try != 2
      puts "Код неверный. Повторите:"
    end
      @try += 1
    break if @pin_card == pin

    if @try == 3
      lock_card
      abort "\nВы 3 раза ввели неверный PIN. Карта заблокирована, обратитесь в ближайшее отделение банка.\n".center(290, "~")
    end
  end
end

def card_balance
  balance_info = File.open(@read_card)
  balance_read = balance_info.readlines.map { |b| b.chomp}
    balance_update = balance_read[4].to_f.round(2)
end

def update_balance(sum_balance)
  buffer = File.open(BALANCE, "w")
  File.foreach(@read_card).with_index do |balance, index|
    buffer.puts(index == 4 ? sum_balance : balance)
  end

  buffer.close
  File.write(@read_card, File.read(BALANCE))
  File.delete(BALANCE) if File.exist?(BALANCE)
end

def add_cash
  print "\nВведите сумму для пополнения. Сумма должна быть больше 0 >> "
    input_cash = gets.chomp.to_f
    if input_cash > 0.0
    sum_balance = card_balance + input_cash

      update_balance(sum_balance)

    puts "\nБаланс карты пополнен на #{input_cash} $ и составляет #{card_balance} $.\n".center(253, "#")
    elsif input_cash <= 0.0
      print "\nСумма не должна быть нулевой. Будет произведен выход в главное меню.\n".center(268, "#")
    end
end

def withdraw_cash
  loop do
    print "\nВведите сумму для снятия >> "
      input_cash = gets.chomp.to_f

      if input_cash > card_balance
        puts "\nНа вашем счету недостаточно средств.\n".center(236, "*")
      elsif input_cash <= card_balance
        sum_balance = card_balance - input_cash
          update_balance(sum_balance)
      puts "\nБыло снято #{input_cash} $, текущий баланс составляет #{card_balance} $\n"
      end
    break if input_cash > card_balance || input_cash <= card_balance
  end

end

def balance_show
  puts "\nБаланс Вашей карты составляет #{card_balance} $.\n"
end

def select_operation

  puts "\n#{@card_info_string}"

  loop do
    pin

    print " Выберите тип операции ".center(99, "=") 

      puts "\n\n#{" 1.Внести наличные.".rjust(22, ">")}\n\n#{" 2.Снять наличные.".rjust(21, ">")}\n\n#{" 3.Проверить баланс.".rjust(23, ">")}\n\n#{" 4.Выход".rjust(11, ">")}"

    print "\nВвод >> "
      case @set_function = gets.chomp.to_i

    when 1
      add_cash

    when 2
      withdraw_cash

    when 3
      balance_show

    when 4
      abort " Работа с картой завершена. Не забудьте забрать карту. ".center(99, "=")

    else
      puts "\nТакой операции не существует, повторите выбор.\n".center(246, "=")
    end
  end
end

start_system(card_list)

initialized

lock_verification

select_operation
