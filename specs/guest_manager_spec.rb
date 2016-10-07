require('minitest/autorun')
require('minitest/rg')
require_relative('../guest_manager')
require_relative('../guest')

require('pry-byebug')

class GuestManagerTest < MiniTest::Test

  def setup()
    @my_guest_manager = GuestManager.new()
    @mark_jones = Guest.new("Mark", "Jones")
  end

  def test_can_add_guest()
    @my_guest_manager.add_guest("Mark", "Jones")
    assert(@my_guest_manager.guests.include?(@mark_jones))
  end

end
