require('minitest/autorun')
require('minitest/rg')
require('date')

require_relative('../bar')
require_relative('../guest')

class BarTest < MiniTest::Test

  def setup()
    @empty_bar = Bar.new()
    @bar = Bar.new()

    # guests
    @mike_jones = Guest.new(first_name: "Mike", last_name: "Jones", date_of_birth: Date.new(1999, 2, 24), confidence: 15)
    @terry_marx = Guest.new(first_name: "Terry", last_name: "Marx", date_of_birth: Date.new(1992, 3, 1), confidence: 3)
    @sam_torrence = Guest.new(first_name: "Sam", last_name: "Torrence", date_of_birth: Date.new(1996, 1, 2), confidence: 18)
    @ben_james = Guest.new(first_name: "Ben", last_name: "James", date_of_birth: Date.new(1987, 12, 2), confidence: 13)
    @alan_cummings = Guest.new(first_name: "Alan", last_name: "Cummings", date_of_birth: Date.new(1979, 5, 12), confidence: 8)
    @catriona_jeorrett = Guest.new(first_name: "Catriona", last_name: "Jeorrett", date_of_birth: Date.new(1945, 9, 4), confidence: 10)
    @alison_jeorrett = Guest.new(first_name: "Alison", last_name: "Jeorrett", date_of_birth: Date.new(1954, 5, 29), confidence: 20)

    @bar.add_guest(@mike_jones)
    @bar.add_guest(@terry_marx)
    @bar.add_guest(@sam_torrence)
  end

  def test_bar_has_queue()
    assert_equal(Array, @bar.queue().class())
  end

  def test_can_add_guest_to_queue()
    @bar.add_guest(@mike_jones)
    assert(@bar.queue.include?(@mike_jones), "Queue does not include Mike Jones")
  end

  def test_can_sell_drink()
    initial_confidence = @mike_jones.confidence()
    @bar.sell_drink()
    assert_equal(false, @bar.queue.include?(@mike_jones))
    assert(@mike_jones.confidence >= initial_confidence + 1, "Confidence should increase by at lease 1")
    assert(@mike_jones.confidence <= initial_confidence + 3, "Confidence should not increase by more than 3")
    assert(!@mike_jones.at_bar(), ".at_bar status should be false")
  end

  def test_queue_size()
    assert(3, @bar.queue_size())
  end

end
