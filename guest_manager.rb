require('pry-byebug')

class GuestManager

  attr_reader :guests

  def initialize
    @guests = []
  end

  def add_guest(first_name, last_name, birth_year, birth_month, birth_day)
    birthday = Date.new(birth_year, birth_month, birth_day)
    new_guest = Guest.new(first_name, last_name, birthday)
    @guests.push(new_guest)
  end

  def has_guest(guest)
    return @guests.include?(guest)
  end

end
