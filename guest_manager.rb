require_relative('yaml_load_save')

require('pry-byebug')

class GuestManager

  attr_reader :guests

  def initialize(save_file_path)
    @save_file_path = save_file_path
    load_guests()
  end

  def add_guest(first_name, last_name, birth_year, birth_month, birth_day)
    birthday = Date.new(birth_year, birth_month, birth_day)
    new_guest = Guest.new(first_name, last_name, birthday)
    if has_guest(new_guest)
      return false
    else
      @guests.push(new_guest)
    end
  end

  def has_guest(guest)
    return @guests.include?(guest)
  end

  def save_guests()
    YamlLoadSave::save(@save_file_path, @guests)
  end

  def load_guests()
    guests = YamlLoadSave::load(@save_file_path)
    
    if guests
      @guests = guests
    else
      @guests = []
    end
  end

end
