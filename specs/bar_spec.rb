require('minitest/autorun')
require('minitest/rg')

require_relative('../bar')
require_relative('../guest')

class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new()
  end

  def test_bar_has_queue()
    assert_equal(Array, @bar.queue().class())
  end

end
