RNCB = 'RNCB.txt'
SBER = 'Sberbank.txt'
TINKOFF = 'Tinkoff.txt'

class Card

  attr_accessor :used_card, :card_data, :balance, :lock_info, :pin

  def initialize()
    @lock_info = lock_info
    @pin = pin
    @balance = balance
    @used_card = used_card
    @card_data = card_data
  end

  def rncb
    self.used_card = RNCB
    @file = File.open(RNCB)
    card_data_info
    card_user_info
    self.lock_info = card_data[7] [7..-1]
    self.pin = card_data[1][11..-1].to_i
  end

  def sberbank
    self.used_card = SBER
    @file = File.open(SBER)
    card_data_info
    card_user_info
    self.lock_info = card_data[7] [7..-1]
  end

  def tinkoff
    self.used_card = TINKOFF
    @file = File.open(TINKOFF)
    card_data_info
    card_user_info
    self.lock_info = card_data[7] [7..-1]
  end

  def card_data_info
    self.card_data = @file.readlines.map { |x| x.chomp }
  end

  def card_user_info
    card_info = card_data[2..3].join("\n")
    print "\n#{card_info}\n"
  end

  def card_balance
    balance_info = File.open(used_card)
    balance_read = balance_info.readlines.map { |b| b.chomp}
      self.balance = balance_read[5].to_f.round(2)
  end

  def card_information
    @bank_info = card_data[0]
  end
end