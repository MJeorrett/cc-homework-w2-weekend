require('minitest/autorun')
require('minitest/rg')
require_relative('../guest_manager')
require_relative('../guest')

require('pry-byebug')

class GuestManagerTest < MiniTest::Test

  def setup()
    @empty_guest_manager = GuestManager.new()
    @my_guest_manager = GuestManager.new()

    guest_names = [
      ["Mike", "Jones"],
      ["Terry", "Marx"],
      ["Sam", "Torrence"],
      ["Ben", "James"],
      ["Alan", "Cummings"],
      ["Catriona", "Jeorrett"],
      ["Alison", "Jeorrett"]
    ]

    guest_names.each { |guest| @my_guest_manager.add_guest(guest[0], guest[1])}
  end

  def test_can_add_guest()
    @empty_guest_manager.add_guest("Mark", "Jones")
    mark_jones = Guest.new("Mark", "Jones")
    assert(@empty_guest_manager.guests.include?(mark_jones))
  end

  def test_guest_has_record()
    mike_jones = Guest.new("Mike", "Jones")
    assert(@my_guest_manager.has_guest(mike_jones))
  end

end
