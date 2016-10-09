require_relative('yaml_load_save')

require('pry-byebug')

class GuestManager

  SAVE_FILE_NAME = "data/guests.txt"

  attr_reader :guests

  def initialize
    @guests = []
  end

  def add_guest(first_name, last_name, birth_year, birth_month, birth_day)
    birthday = Date.new(birth_year, birth_month, birth_day)
    new_guest = Guest.new(first_name, last_name, birthday)
    @guests.push(new_guest)

    save_guests()
  end

  def has_guest(guest)
    return @guests.include?(guest)
  end

  def save_guests()
    YamlLoadSave::save(SAVE_FILE_NAME, @guests)
  end

  def load_guests()
    @guests = YamlLoadSave::load(SAVE_FILE_NAME)
  end

end
