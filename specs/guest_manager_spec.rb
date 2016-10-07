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
      ["Mike", "Jones", 1999, 2, 24],
      ["Terry", "Marx", 1992, 3, 1],
      ["Sam", "Torrence", 1996, 1, 2],
      ["Ben", "James", 1987, 12, 2],
      ["Alan", "Cummings", 1979, 5, 12],
      ["Catriona", "Jeorrett", 1945, 9, 4],
      ["Alison", "Jeorrett", 1954, 5, 29]
    ]

    guest_names.each do |guest|
      @my_guest_manager.add_guest(guest[0], guest[1], guest[2], guest[3], guest[4])
    end
  end

  def test_can_add_guest()
    @empty_guest_manager.add_guest("Mark", "Jones", 1967, 10, 23)
    mark_jones = Guest.new("Mark", "Jones", Date.new(1967, 10, 23))
    assert(@empty_guest_manager.guests.include?(mark_jones))
  end

  def test_has_guest()
    mike_jones = Guest.new("Mike", "Jones", Date.new(1999, 2, 24))
    assert(@my_guest_manager.has_guest(mike_jones))
  end

end
