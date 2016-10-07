class RoomManager

  attr_reader :rooms

  def initialize()
    @rooms = []
  end

  def add_room(room_name, capacity)
    new_room = Room.new(room_name, capacity)
    @rooms.push(new_room)
  end

  def room_names()
    return @rooms.map do |room|
      room.name
    end
  end

end
