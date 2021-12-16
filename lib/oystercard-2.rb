class Oystercard
  BALANCE_MAXED = 90
  BALANCE_MINIMUM  = 1
  attr_reader :balance, :station_entry

  def initialize
    @balance = 0
    @station_entry = nil
  end

  def top_up(amount)
    fail 'Balance exceeded' if amount + balance > BALANCE_MAXED
    @balance += amount
  end

  def in_journey?
    return false if @station_entry == nil
    return true
  end

  def touch_in(station)
    fail "the balance is too low" if @balance < BALANCE_MINIMUM
    @station_entry = station
  end

  def touch_out
    deduct(BALANCE_MINIMUM)
    @station_entry = nil
  
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end