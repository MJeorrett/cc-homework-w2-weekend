require('minitest/autorun')
require('minitest/rg')
require_relative('../room_manager')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

require('pry-byebug')

class RoomManagerTest < MiniTest::Test

  def setup()
    @my_room_manager = RoomManager.new()

    # rooms
    @sixties_theme_room = Room.new("60s Sensations")

    #songs
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals")
    @do_wah_diddy_diddy = Song.new("Do Wah", "Manfred Mann")

    #guests
    @mike_jones = Guest.new("Mike", "Jones")
  end

  def test_can_add_room()
    @my_room_manager.add_room_with_name("60s Sensations")
    assert(@my_room_manager.rooms.include?(@sixties_theme_room))
  end

end
