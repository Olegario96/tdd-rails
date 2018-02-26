class Car
  attr_accessor :color, :model
  attr_reader :status

  def moving!
    @status = 'The car is Moving!'
  end

  def stopping!
    @status = 'The car is Stopping!'
  end
end
