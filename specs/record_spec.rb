require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../guest2')

require('pry-byebug')

class RecordTest < MiniTest::Test

  def setup()
    @guest_joe_elder = Guest.new("Joe", "Elder")
    @guest_joe_danger_1 = Guest.new("Joe", "Danger")
    @guest_joe_danger_2 = Guest.new("Joe", "Danger")

    @guest2_joe_danger = Guest2.new("Joe", "Danger")
  end

  # '==' tests

  def test_same_object_equals_is_true()
    assert(@guest_joe_danger_1 == @guest_joe_danger_1)
  end

  def test_different_object_same_variable_values_equals_is_true()
    assert(@guest_joe_danger_1 == @guest_joe_danger_2)
  end

  def test_different_varaiable_values_equals_is_false()
    assert_equal(false, @guest_joe_elder == @guest_joe_danger_1)
  end

  def test_different_class_equals_is_false()
    assert_equal(false, @guest_joe_danger_1 == @guest2_joe_danger)
  end


  # '!=' tests

  def test_same_object_not_equals_is_false()
    assert_equal(false, @guest_joe_danger_1 != @guest_joe_danger_1)
  end

  def test_different_object_same_variable_values_not_equals_is_false()
    assert_equal(false, @guest_joe_danger_1 != @guest_joe_danger_2)
  end

  def test_different_varaiable_values_not_equals_is_true()
    assert(@guest_joe_elder != @guest_joe_danger_1)
  end

  def test_different_class_not_equals_is_true()
    assert(@guest_joe_danger_1 != @guest2_joe_danger)
  end


  # array.include? tests

  def test_same_object_include_is_true()
    assert([@guest_joe_danger_1].include?(@guest_joe_danger_1))
  end

  def test_different_object_same_variable_values_include_is_true()
    assert([@guest_joe_danger_1].include?(@guest_joe_danger_2))
  end

  def test_different_varaiable_values_include_is_false()
    assert_equal(false, [@guest_joe_elder].include?(@guest_joe_danger_1))
  end

  def test_different_class_include_is_false()
    assert_equal(false, [@guest_joe_danger_1].include?(@guest2_joe_danger))
  end

end
