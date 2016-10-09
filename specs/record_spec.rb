require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../testing_classes/song2')

require('pry-byebug')

class RecordTest < MiniTest::Test

  def setup()
    @song_happy_birthday = Song.new("Happy Birthday", "Unknown", 1921, "Happy Birthday to you...")
    @song_unhappy_birthday_1 = Song.new("Unhappy Birthday", "Unknown", 1921, "Happy Birthday to you...")
    @song_unhappy_birthday_2 = Song.new("Unhappy Birthday", "Unknown", 1921, "Happy Birthday to you...")

    @song2_unhappy_birthday = Song2.new("Unhappy Birthday", "Unknown", 1921, "Happy Birthday to you...")
  end

  # '==' tests

  def test_same_object_equals_is_true()
    assert(@song_unhappy_birthday_1 == @song_unhappy_birthday_1)
  end

  def test_different_object_same_variable_values_equals_is_true()
    assert(@song_unhappy_birthday_1 == @song_unhappy_birthday_2)
  end

  def test_different_varaiable_values_equals_is_false()
    assert_equal(false, @song_happy_birthday == @song_unhappy_birthday_1)
  end

  def test_different_class_equals_is_false()
    assert_equal(false, @song_unhappy_birthday_1 == @song2_unhappy_birthday)
  end


  # '!=' tests

  def test_same_object_not_equals_is_false()
    assert_equal(false, @song_unhappy_birthday_1 != @song_unhappy_birthday_1)
  end

  def test_different_object_same_variable_values_not_equals_is_false()
    assert_equal(false, @song_unhappy_birthday_1 != @song_unhappy_birthday_2)
  end

  def test_different_varaiable_values_not_equals_is_true()
    assert(@song_happy_birthday != @song_unhappy_birthday_1)
  end

  def test_different_class_not_equals_is_true()
    assert(@song_unhappy_birthday_1 != @song2_unhappy_birthday)
  end


  # array.include? tests

  def test_same_object_include_is_true()
    assert([@song_unhappy_birthday_1].include?(@song_unhappy_birthday_1))
  end

  def test_different_object_same_variable_values_include_is_true()
    assert([@song_unhappy_birthday_1].include?(@song_unhappy_birthday_2))
  end

  def test_different_varaiable_values_include_is_false()
    assert_equal(false, [@song_happy_birthday].include?(@song_unhappy_birthday_1))
  end

  def test_different_class_include_is_false()
    assert_equal(false, [@song_unhappy_birthday_1].include?(@song2_unhappy_birthday))
  end

end
