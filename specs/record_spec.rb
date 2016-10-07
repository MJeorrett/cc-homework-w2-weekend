require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../song2')

require('pry-byebug')

class RecordTest < MiniTest::Test

  def setup()
    @song_joe_elder = Song.new("Joe", "Elder")
    @song_joe_danger_1 = Song.new("Joe", "Danger")
    @song_joe_danger_2 = Song.new("Joe", "Danger")

    @song2_joe_danger = Song2.new("Joe", "Danger")
  end

  # '==' tests

  def test_same_object_equals_is_true()
    assert(@song_joe_danger_1 == @song_joe_danger_1)
  end

  def test_different_object_same_variable_values_equals_is_true()
    assert(@song_joe_danger_1 == @song_joe_danger_2)
  end

  def test_different_varaiable_values_equals_is_false()
    assert_equal(false, @song_joe_elder == @song_joe_danger_1)
  end

  def test_different_class_equals_is_false()
    assert_equal(false, @song_joe_danger_1 == @song2_joe_danger)
  end


  # '!=' tests

  def test_same_object_not_equals_is_false()
    assert_equal(false, @song_joe_danger_1 != @song_joe_danger_1)
  end

  def test_different_object_same_variable_values_not_equals_is_false()
    assert_equal(false, @song_joe_danger_1 != @song_joe_danger_2)
  end

  def test_different_varaiable_values_not_equals_is_true()
    assert(@song_joe_elder != @song_joe_danger_1)
  end

  def test_different_class_not_equals_is_true()
    assert(@song_joe_danger_1 != @song2_joe_danger)
  end


  # array.include? tests

  def test_same_object_include_is_true()
    assert([@song_joe_danger_1].include?(@song_joe_danger_1))
  end

  def test_different_object_same_variable_values_include_is_true()
    assert([@song_joe_danger_1].include?(@song_joe_danger_2))
  end

  def test_different_varaiable_values_include_is_false()
    assert_equal(false, [@song_joe_elder].include?(@song_joe_danger_1))
  end

  def test_different_class_include_is_false()
    assert_equal(false, [@song_joe_danger_1].include?(@song2_joe_danger))
  end

end
