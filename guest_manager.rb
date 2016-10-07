class GuestManager

  attr_reader :guests

  def initialize
    @guests = []
  end

  def add_guest(first_name, last_name)
    new_guest = Guest.new(first_name, last_name)
    @guests.push(new_guest)
  end

end
