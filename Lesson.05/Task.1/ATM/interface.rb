class App

  def self.init(atm)
  
  loop do
    print "\nВыберите банкомат:\n>> 1. РНКБ.\n>> 2. Сбербанк.\n>> 3. Тинькофф.\n\>> 4. Выход\nВвод >> "
      bancomat_list = [1, 2, 3]
      choise_atm = gets.chomp.to_i

    case choise_atm
    when 1
      active_atm = atm.rncb
    when 2
      active_atm = atm.sberbank
    when 3
      active_atm = atm.tinkoff
    when 4
      abort "Благодарим за использование нашего сервиса. Досвидания."
    else 
        print "\nВы не выбрали банкомат. Повторите.\n".center(268, "#")
    end
    break if bancomat_list.include?(choise_atm)
  end
  end

  def self.choise_card(card)
  loop do
    print "\nВставьте карту:\n>> 1. РНКБ.\n>> 2. Сбербанк\n>> 3. Тинькофф.\nВвод >> "
      card_list = [1, 2, 3]
      input_card = gets.chomp.to_i

    case input_card
    when 1
      active_card = card.rncb
    when 2
      active_card = card.sberbank
    when 3
      active_card = card.tinkoff
    else 
      print "\nВы не вставили карту. Повторите.\n".center(268, "#")
    end
    break if card_list.include?(input_card)
  end

  def self.select_operation(atm, card)

    loop do
      
      atm.pin_request(card)
  
      print " Выберите тип операции ".center(99, "=") 
  
        puts "\n\n#{" 1.Внести наличные.".rjust(22, ">")}\n\n#{" 2.Снять наличные.".rjust(21, ">")}\n\n#{" 3.Проверить баланс.".rjust(23, ">")}\n\n#{" 4.Выход".rjust(11, ">")}"
  
      print "\nВвод >> "
        set_function = gets.chomp.to_i

        case set_function
        when 1
          atm.add_cash(card)
        when 2
          atm.withdraw_cash(card)
        when 3
          atm.balance_show(card)
        when 4
          abort " Работа с картой завершена. Не забудьте забрать карту. ".center(99, "=")
        else
          puts "\nТакой операции не существует, повторите выбор.\n".center(246, "=")
        end
      end
    end
  end
end
