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
    first_guest.boost_confidence(1 + (rand * 2).round(1))
    first_guest.leave_bar() if first_guest
  end

  def queue_size()
    return @queue.count()
  end

  def get_description()
    guest_descriptions = @queue.map { |guest| guest.get_description }

    return "BAR CARAOKE\nqueue: " + guest_descriptions.join(", ")
  end

end
