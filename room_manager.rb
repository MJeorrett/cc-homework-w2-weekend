require('yaml')

class RoomManager

  attr_reader :rooms

  def initialize()
    @rooms = []
  end

  def add_room(room_name, capacity)
    if room_names.include?(room_name)
      return false
    else
      new_room = Room.new(room_name, capacity)
      @rooms.push(new_room)
      return new_room
    end
  end

  def room_names()
    return @rooms.map do |room|
      room.name
    end
  end

  def remove_room(room_name)
    room_to_delete = nil
    @rooms.each do |room|
      if room.name == room_name
        room_to_delete = room
      end
    end

    if room_to_delete
      @rooms.delete(room_to_delete)
      return room_to_delete
    else
      return false
    end
  end

  def save_rooms()
    File.open("data/rooms.txt", 'w') do |file|
      file.write(@rooms.to_yaml)
    end
  end

  def load_rooms()
    @rooms = YAML::load(File.read("data/rooms.txt"))
  end

end
