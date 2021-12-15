class Oystercard
  BALANCE_MAXED = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'Balance exceeded' if amount + balance > BALANCE_MAXED
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end