class Oystercard
  BALANCE_MAXED = 90
  BALANCE_MINIMUM  = 1
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
    fail "the balance is too low" if @balance < BALANCE_MINIMUM
    @touch_in = true
  end

  def touch_out
    deduct(BALANCE_MINIMUM)
    @touch_in = false
  end
end