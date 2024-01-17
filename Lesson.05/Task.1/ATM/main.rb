require './interface.rb'
require './atm.rb'
require './card.rb'
require 'pry'
BUFFER = 'buffer.txt'

atm = CashMachine.new
  App.init(atm)

card = Card.new
  App.choise_card(card)

atm.lock_verification(card)
  App.select_operation(atm, card)
