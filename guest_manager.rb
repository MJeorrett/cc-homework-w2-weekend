require_relative('yaml_load_save')

require('pry-byebug')

class GuestManager

  attr_reader :guests

  def initialize(save_file_path)
    @save_file_path = save_file_path
    load_guests()
  end

  def add_guest(params)
    birthday = Date.new(params[:birth_year], params[:birth_month], params[:birth_day])
    new_guest = Guest.new(first_name: params[:first_name], last_name: params[:last_name], date_of_birth: birthday, confidence: params[:confidence])
    if has_guest(new_guest)
      return false
    else
      @guests.push(new_guest)
      return new_guest
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
