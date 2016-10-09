class Bar

  attr_reader :queue

  def initialize()
    @queue = []
  end

  def add_guest(guest)
    @queue.push(guest)
  end

  def sell_drink()
    first_guest = @queue.shift()
    first_guest.boost_confidence(1 + (rand * 2))
    first_guest.leave_bar() if first_guest
  end

end
