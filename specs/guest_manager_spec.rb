require('minitest/autorun')
require('minitest/rg')
require_relative('../guest_manager')
require_relative('../guest')

require('pry-byebug')

class GuestManagerTest < MiniTest::Test

  def setup()
    @empty_guest_manager = GuestManager.new("test_data/empty_guest_manager_guests.txt")
    @my_guest_manager = GuestManager.new("test_data/my_guest_manager_guests.txt")

    guest_names = [
      ["Mike", "Jones", 1999, 2, 24, 9],
      ["Terry", "Marx", 1992, 3, 1, 0],
      ["Sam", "Torrence", 1996, 1, 2, 4],
      ["Ben", "James", 1987, 12, 2, 2],
      ["Alan", "Cummings", 1979, 5, 12, 15],
      ["Catriona", "Jeorrett", 1945, 9, 4, 7],
      ["Alison", "Jeorrett", 1954, 5, 29, 12]
    ]

    guest_names.each do |guest|
      @my_guest_manager.add_guest(first_name: guest[0], last_name: guest[1], birth_year: guest[2], birth_month: guest[3], birth_day: guest[4], confidence: guest[5])
    end
  end

  def test_can_add_guest()
    @empty_guest_manager.add_guest(first_name: "Mark", last_name: "Jones", birth_year: 1967, birth_month: 10, birth_day: 23, confidence: 6)
    mark_jones = Guest.new(first_name: "Mark", last_name: "Jones", date_of_birth: Date.new(1967, 10, 23), confidence: 6)
    assert(@empty_guest_manager.guests.include?(mark_jones))
  end

  def test_cant_duplicate_guest_details()
    assert_equal(false, @my_guest_manager.add_guest(first_name: "Terry", last_name: "Marx", birth_year: 1992, birth_month: 3, birth_day: 1, confidence: 0))
    number_of_terry_marxes = @my_guest_manager.guests().count do |guest|
      guest.full_name == "Terry Marx"
    end
    assert_equal(1, number_of_terry_marxes)
  end

  def test_has_guest()
    mike_jones = Guest.new(first_name: "Mike", last_name: "Jones", date_of_birth: Date.new(1999, 2, 24), confidence: 9)
    assert(@my_guest_manager.has_guest(mike_jones))
  end

  def test_can_save_then_load()
    @my_guest_manager.save_guests()
    @my_guest_manager.add_guest(first_name: "Tom", last_name: "Cat", birth_year: 2001, birth_month: 9, birth_day: 23, confidence: 13)
    @my_guest_manager.load_guests()
    tom_cat = Guest.new(first_name: "Tom", last_name: "Cat", birthday: Date.new(2001, 9, 23), confidence: 13)
    assert_equal(false, @my_guest_manager.guests().include?(tom_cat))
    assert_equal(7, @my_guest_manager.guests().count())
  end

end
