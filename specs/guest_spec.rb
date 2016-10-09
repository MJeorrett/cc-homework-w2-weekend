require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')

require('date')

class GuestTest < MiniTest::Test

  def setup()
    @mike_jones = Guest.new("Mike", "Jones", Date.new(1986, 10, 30))
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

  def test_age_correct()
    assert_equal(29, @mike_jones.age)
  end

  def test_year_turned_16()
    assert_equal(2002, @mike_jones.year_turned_16())
  end

end
