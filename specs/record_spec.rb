require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../guest2')

class RecordSpec < MiniTest::Test

  def setup()
    @guest_joe_elder = Guest.new("Joe", "Elder")
    @guest_joe_danger_1 = Guest.new("Joe", "Danger")
    @guest_joe_danger_2 = Guest.new("Joe", "Danger")

    @guest2_joe_danger = Guest2.new("Joe", "Danger")
  end

  def test_same_object_matches()
    assert(@guest_joe_danger_1 == @guest_joe_danger_1)
  end

  def different_object_same_values_matches()
    assert(@guest_joe_danger_1 == @guest_joe_danger_2)
  end

  def test_different_varaible_values_doesnt_match()
    assert_equal(false, @guest_joe_elder == @guest_joe_danger_1)
  end

  def test_different_class_doesnt_match()
    assert_equal(false, @guest_joe_danger_1 == @guest2_joe_danger)
  end

end
