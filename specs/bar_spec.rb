require('minitest/autorun')
require('minitest/rg')
require('date')

require_relative('../bar')
require_relative('../guest')

class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new()

    @mike_jones = Guest.new(first_name:"Mike", last_name: "Jones", date_of_birth: Date.new(1986, 10, 30), confidence: 9)
  end

  def test_bar_has_queue()
    assert_equal(Array, @bar.queue().class())
  end

  def test_can_add_guest_to_queue()
    @bar.add_guest(@mike_jones)
    assert(@bar.queue.include?(@mike_jones))
  end

end
