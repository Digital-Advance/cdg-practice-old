# (RU)

# Запуск скрипта

```sh
    ruby main.rb
```

# Описание работы программы (RU)
Программа состоит из нескольких файлов:

>- 'main.rb - основной файл запуска'
>- 'interface.rb - файл стартового интерфейса'
>- 'atm.rb - файл класса CashMachine'
>- 'card.rb - файл класса Card'
>- 'RNCB.txt, Sberbank.txt, Tinkoff.txt - файлы с данными карты'

Запуск производится с помощью основного 'main.rb' файла. После запуска скрипта из файла 'interface.rb' запускается метод запроса выбора банкомата. На выбор представлены 3 банкомата: (РНКБ, Сбербанк, Тинькофф). После выбора нужного банкомата из файла 'atm.rb' создается экземпляр класса "CashMachine". Далее необходимо выбрать карту, названия карт соответствуют названию банкоматов. После выбора нужной карты из файла 'card.rb' создается экземпляр класса "Card". Далее банкомат с помощью метода класса "CashMachine" проверяет информацию о блокировке карты которая содержится в переменной 'lock_info' экземпляра карты. 

>- Если 'lock_info = "true"', программа завершается и сообщает, что карта заблокирована.
>- Если 'lock_info = "false"', продолжается выполнение программы и банкомат запрашивает ввод PIN кода. 

PIN код содержится в переменной 'pin' экземпляра карты и считывается из файла карты. 

>- Если PIN введен неверно 3 раза то метод 'lock_card' экземпляра банкомата блокирует карту изменяя информацию о блокировке в файле на 'true', после чего программа завершается и уведомляет пользователя о блокировке карты.
>- Если PIN введен верно, программа продолжается и запускает из файла 'interface.rb' метод "set_function".

Пользователю предлагается выбрать 4 функции:

1. Внести наличные.
2. Снять наличные.
3. Проверить баланс.
4. Выход.

При внесении наличных программа запросит ввести сумму для пополнения. Сумма не должна быть 0. 

>- Если введенная сумма будет равна 0 программа выдаст уведомление и выйдет в главное меню.
>- Если введенная сумма будет больше 0, то банкомат запускает метод "add_cash" который складывает введенную сумму с балансом на карте и запускает метод "update_balance", это один из методов CRUD, который перезаписывает информацию о новом балансе в файл карты. После чего система выводит уведомление об успешном зачислении средств и показывает текущий баланс карты.

При снятии наличных программа так же запросит сумму для снятие, которая не должна быть 0.

>- Если введенная сумма будет равна 0 программа выдаст уведомление и выйдет в главное меню.
>- Если введенная сумма больше чем баланс на карте программа выдаст уведомление о недостатке средств на балансе и выйдет в главное меню.
>- Если введенная сумма будет меньше баланса на карте, то банкомат запускает метод "withdraw_cash" который отнимает введенную сумму от баланса на карте после чего запускает метод "update_balance", это один из методов CRUD, который перезаписывает информацию о новом балансе в файл карты. После чего система выводит уведомление об успешном снятии средств и показывает текущий баланс карты.

При выходе из банкомата программа завершается и выдает уведомление: 

(***"Работа с картой завершена. Не забудьте забрать карту."***)

# Основная информация

>- В репозитории находятся подписанные скриншоты примера работы программы.
>- ПИН код прописан в файле карты

# Лицензия

MIT

# Инструкция (RU)
После запуска программы нужно выбрать одну из предложенных карт. После чего программа покажет номер карты и ФИО держателя карты. Далее программа запросит ввести ПИН код. При неправильном вводе ПИН кода  3 раза, карта блокируется. Последующее использование карты будет невозможно. Карту можно разблокировать только после изменения информации о блокировке в файле карты.

При правильном вводе пин кода программа предложит выбрать операции:

1. Добавить наличные.
2. Снять наличные.
3. Показать баланс.
4. Выход.

При выборе операций с изменением баланса программа перезапишет инфармацию о балансе в файле выбранной в самом начале карты.

Так же после выполнения каждой операции для обеспечения безопасности программа будет запрашивать ПИН код.
<hr>

# (EN)

# Start script

```sh
    ruby main.rb
```

# Description of the program (EN)

The program consists of several files:

>- 'main.rb - main startup file'
>- 'interface.rb - start interface file'
>- 'atm.rb - CashMachine class file'
>- 'card.rb - Card class file'
>- 'RNCB.txt, Sberbank.txt, Tinkoff.txt - files with card data'

The launch is done using the main 'main.rb' file. After running the script from the 'interface.rb' file, the ATM selection request method is launched. There are 3 ATMs to choose from: (RNKB, Sberbank, Tinkoff). After selecting the desired ATM from the 'atm.rb' file, an instance of the "CashMachine" class is created. Next, you need to select a card, the names of the cards correspond to the name of the ATMs. After selecting the desired card from the 'card.rb' file, an instance of the "Card" class is created. Next, the ATM, using the "CashMachine" class method, checks the card lock information contained in the 'lock_info' variable of the card instance.

>- If 'lock_info = "true"', the program exits and reports that the card is locked.
>- If 'lock_info = "false"', program execution continues and the ATM asks for a PIN code.

The PIN code is contained in the 'pin' variable of the card instance and is read from the card file.

>- If the PIN is entered incorrectly 3 times, then the 'lock_card' method of the ATM instance locks the card by changing the lock information in the file to 'true', after which the program exits and notifies the user that the card is locked.
>- If the PIN is correct, the program continues and runs the "set_function" method from the 'interface.rb' file.

The user is prompted to select 4 functions:

1. Deposit cash.
2. Withdraw cash.
3. Check balance.
4. Exit.

When depositing cash, the program will ask you to enter the amount to replenish. The sum must not be 0.

>- If the amount entered is equal to 0, the program will issue a notification and exit to the main menu.
>- If the entered amount is greater than 0, then the ATM runs the "add_cash" method, which adds the entered amount to the balance on the card and runs the "update_balance" method, this is one of the CRUD methods that overwrites the information about the new balance in the card file. After that, the system displays a notification about the successful transfer of funds and shows the current balance of the card.

When withdrawing cash, the program will also request the amount for withdrawal, which should not be 0.

>- If the amount entered is equal to 0, the program will issue a notification and exit to the main menu.
>- If the entered amount is more than the balance on the card, the program will issue a notification about the lack of funds on the balance and exit to the main menu.
>- If the entered amount is less than the balance on the card, then the ATM runs the "withdraw_cash" method, which subtracts the entered amount from the balance on the card, and then runs the "update_balance" method, this is one of the CRUD methods that overwrites information about the new balance in the card file. After that, the system displays a notification about the successful withdrawal of funds and shows the current balance of the card.

When you exit the ATM, the program ends and issues a notification:
(***"The card is complete. Don't forget to pick up the map."***)

# General information

>- The repository contains signed screenshots of an example of the program.
>- PIN code is registered in the card file

# License

MIT

# Instruction (EN)
After starting the program, you need to select one of the proposed cards. After that, the program will show the card number and the name of the cardholder. Next, the program will ask you to enter a PIN code. If the PIN code is entered incorrectly 3 times, the card will be blocked. Subsequent use of the card will be impossible. The card can only be unlocked after the lock information in the card file has been changed.

If you enter the PIN code correctly, the program will prompt you to select operations:

1. Add cash.
2. Withdraw cash.
3. Show balance.
4. Exit.

When choosing operations with a balance change, the program will overwrite the information about the balance in the file of the card selected at the very beginning.

Also, after performing each operation, to ensure security, the program will request a PIN code.