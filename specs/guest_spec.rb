require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../song')

require('date')

class GuestTest < MiniTest::Test

  def setup()
    @mike_jones = Guest.new(first_name: "Mike", last_name: "Jones", date_of_birth: Date.new(1986, 10, 30), confidence: 9)

    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals", 1990, ["At the house of the rising sun", "strange stuff happens"])
  end

  def test_guest_has_first_name()
    assert_equal("Mike", @mike_jones.first_name)
  end

  def test_guest_has_last_name()
    assert_equal("Jones", @mike_jones.last_name)
  end

  def test_guest_has_full_name()
    assert_equal("Mike Jones", @mike_jones.full_name)
  end

  def test_guest_has_date_of_birth()
    expected = Date.new(1986, 10, 30)
    assert_equal(expected, @mike_jones.date_of_birth())
  end

  def test_guest_has_confidence()
    assert_equal(9, @mike_jones.confidence())
  end

  def test_age_correct()
    assert_equal(29, @mike_jones.age)
  end

  def test_year_turned_16()
    assert_equal(2002, @mike_jones.year_turned_16())
  end

  def test_desire_to_sing_song()
    assert_equal(97, @mike_jones.desire_to_sing(@house_of_the_rising_sun))
  end

  def test_get_description()
    assert_equal("Mike Jones(2002, 9.0)", @mike_jones.get_description)
  end

end
