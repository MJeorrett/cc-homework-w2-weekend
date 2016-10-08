require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals", 1964, "At the house of the rising sun strange stuff happens")
  end

  def test_has_title()
    assert_equal("House of the Rising Sun", @house_of_the_rising_sun.title())
  end

  def test_has_artist()
    assert_equal("The Animals", @house_of_the_rising_sun.artist())
  end

  def test_song_has_release_year()
    assert_equal(1964, @house_of_the_rising_sun.release_year())
  end

  def test_song_has_lyrics()
    expected = "At the house of the rising sun strange stuff happens"
    assert_equal(expected, @house_of_the_rising_sun.lyrics)
  end

end
