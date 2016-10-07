class RoomManager

  attr_reader :rooms

  def initialize()
    @rooms = []
  end

  def add_room_with_name(room_name)
    new_room = Room.new(room_name)
    @rooms.push(new_room)
  end

end
