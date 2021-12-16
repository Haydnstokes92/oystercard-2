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

  def in_journey?
    @touch_in
  end

  def touch_in
    @touch_in = true
  end

  def touch_out
    @touch_in = false
  end
end