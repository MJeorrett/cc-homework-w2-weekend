require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals")
  end

  def test_has_title()
    assert_equal("House of the Rising Sun", @house_of_the_rising_sun.title())
  end

  def test_has_artist()
    assert_equal("The Animals", @house_of_the_rising_sun.artist())
  end

end
