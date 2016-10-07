require('minitest/autorun')
require('minitest/rg')
require_relative('../room_manager')
require_relative('../room')
require_relative('../guest')

require('pry-byebug')

class RoomManagerTest < MiniTest::Test

  def setup()
    @empty_room_manager = RoomManager.new()

    @my_room_manager = RoomManager.new()
    @my_room_manager.add_room("70s Magic", 6)
    @my_room_manager.add_room("80s Beats", 10)
    @my_room_manager.add_room("90s Classics", 15)

    # rooms
    @sixties_theme_room = Room.new("60s Sensations", 8)

    #songs
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals")
    @do_wah_diddy_diddy = Song.new("Do Wah", "Manfred Mann")

    #guests
    @mike_jones = Guest.new("Mike", "Jones")
    @terry_marx = Guest.new("Terry", "Marx")
    @sam_torrence = Guest.new("Sam", "Torrence")
    @ben_james = Guest.new("Ben", "James")
    @alan_cummings = Guest.new("Alan", "Cummings")
    @catriona_jeorrett = Guest.new("Catriona", "Jeorrett")
    @alison_jeorrett = Guest.new("Alison", "Jeorrett")
  end

  def test_can_add_room()
    @empty_room_manager.add_room("60s Sensations", 8)
    assert(@empty_room_manager.rooms.include?(@sixties_theme_room))
  end

  def test_get_room_names()
    expected = ["70s Magic", "80s Beats", "90s Classics"]
    assert_equal(expected, @my_room_manager.room_names())
  end

  def test_cant_duplicate_room_names()
    assert_equal(false, @my_room_manager.add_room("70s Magic", 8))
    number_of_70s_magic_rooms = @my_room_manager.rooms.count do |room|
      room.name() == "70s Magic"
    end
    assert_equal(1, number_of_70s_magic_rooms)
  end

end
