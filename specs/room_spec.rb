require('minitest/autorun')
require('minitest/rg')
require_relative('../room')

class RoomTest < MiniTest::Test

  def setup()
    @sixties_theme_room = Room.new("60s Sensations")
  end

  def test_has_name()
    assert_equal("60s Sensations", @sixties_theme_room.name)
  end

end
