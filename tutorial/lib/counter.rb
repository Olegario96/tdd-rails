class Counter
  @qty = 0

  def self.quantity
    @qty
  end

  def self.incrementor
    @qty += 1
  end
end
