require './card.rb'
require 'pry'

class CashMachine < Card

  def hello
    print " Добро пожаловать в".rjust(72, "=")
  end

  def rncb
    print "#{hello} РНКБ ".ljust(58, "=") 
  end

  def sberbank
    print "#{hello} Сбербанк ".ljust(58, "=") 
  end

  def tinkoff
    print "#{hello} Тинькофф ".ljust(58, "=") 
  end

  def lock_verification(card)
    lock_check = card.lock_info
    if lock_check == "true"
      abort "\nВаша карта заблокирована, обратитесь в ближайшее отделение банка.\n".center(265, "~")
    end
  end

  def lock_card(card)
    lock_card_text = "lock = true"
    buffer = File.open(BUFFER, "w")
    File.foreach(card.used_card).with_index do |lock, index|
      buffer.puts(index == 7 ? lock_card_text : lock)
    end
  
    buffer.close
    File.write(card.used_card, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end

  def pin_request(card)
    try = 0
    loop do
      print "\nPIN код >> "
        pin = gets.chomp.to_i
      if card.pin == pin
        puts "Код принят.\n\n"
      elsif try != 2
        puts "Код неверный. Повторите:"
      end
      try += 1 
        break if card.pin == pin
      if try == 3
        lock_card(card)
        abort "\nВы 3 раза ввели неверный PIN. Карта заблокирована, обратитесь в ближайшее отделение банка.\n".center(290, "~")
      end
    end
  end

  def update_balance(sum_balance, card)
    buffer = File.open(BUFFER, "w")
    File.foreach(card.used_card).with_index do |balance, index|
      buffer.puts(index == 5 ? sum_balance : balance)
    end
  
    buffer.close
    File.write(card.used_card, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end

  def check_balance(card)
    balance_info = File.open(card.used_card)
    balance_read = balance_info.readlines.map { |b| b.chomp}
      current_balance = balance_read[5].to_f.round(2)
  end

  def add_cash(card)

    print "\nВведите сумму для пополнения. Сумма должна быть больше 0 >> "
      input_cash = gets.chomp.to_f

      if input_cash > 0.0
        card.card_balance
      sum_balance = card.balance + input_cash

        update_balance(sum_balance, card)
  
      puts "\nБаланс карты пополнен на #{input_cash} $ и составляет #{check_balance(card)} $.\n".center(253, "#")
      elsif input_cash <= 0.0
        print "\nСумма не должна быть нулевой. Будет произведен выход в главное меню.\n".center(268, "#")
      end
  end

  def withdraw_cash(card)
    loop do
      card.card_balance
      print "\nВведите сумму для снятия >> "
        input_cash = gets.chomp.to_f
  
        if input_cash > card.balance
          puts "\nНа вашем счету недостаточно средств.\n".center(236, "*")
        elsif input_cash == 0.0
          print "\nСумма не должна быть нулевой. Будет произведен выход в главное меню.\n".center(268, "#")
        elsif input_cash <= card.balance
          sum_balance = card.balance - input_cash
            update_balance(sum_balance, card)
        puts "\nБыло снято #{input_cash} $, текущий баланс составляет #{check_balance(card)} $\n".center(254, "#")
        end
      break if input_cash > card.balance || input_cash <= card.balance
    end
  end

  def balance_show(card)
    puts "\nБаланс Вашей карты составляет #{check_balance(card)} $.\n".center(254, "#")
  end
end
