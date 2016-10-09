class Bar

  attr_reader :queue

  def initialize()
    @queue = []
  end

  def add_guest(guest)
    @queue.push(guest)
  end

end
