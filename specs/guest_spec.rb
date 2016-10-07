require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup()
    @mike_jones = Guest.new("Mike", "Jones")
  end

  def test_guest_has_first_name()
    assert_equal("Mike", @mike_jones.first_name)
  end

  def test_guest_has_last_name()
    assert_equal("Jones", @mike_jones.last_name)
  end

  def test_geust_has_full_name()
    assert_equal("Mike Jones", @mike_jones.full_name)
  end

end
