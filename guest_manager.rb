require('pry-byebug')

class GuestManager

  attr_reader :guests

  def initialize
    @next_guest_id = 0
    @guests = []
  end

  def add_guest(first_name, last_name)
    new_guest = Guest.new(first_name, last_name, get_next_guest_id())
    @guests.push(new_guest)
  end

  def has_guest(guest)
    return @guests.include?(guest)
  end

  private

  def get_next_guest_id()
    id = @next_guest_id
    @next_guest_id += 1
    return id
  end

end
