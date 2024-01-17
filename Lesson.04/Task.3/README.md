# Start script

```sh
    ruby bancomat.rb
```

# General information \ Основная информация
- В репозитории находятся подписанные скриншоты примера работы программы.
- The repository contains signed screenshots of an example of the program.
- ПИН код прописан в файле карты
- PIN code is registered in the card file


# License

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

# Instruction (EN)
After starting the program, you need to select one of the proposed cards. After that, the program will show the card number and the name of the cardholder. Next, the program will ask you to enter a PIN code. If the PIN code is entered incorrectly 3 times, the card will be blocked. Subsequent use of the card will be impossible. The card can only be unlocked after the lock information in the card file has been changed.

If you enter the PIN code correctly, the program will prompt you to select operations:

1. Add cash.
2. Withdraw cash.
3. Show balance.
4. Exit.

When choosing operations with a balance change, the program will overwrite the information about the balance in the file of the card selected at the very beginning.

Also, after performing each operation, to ensure security, the program will request a PIN code.
