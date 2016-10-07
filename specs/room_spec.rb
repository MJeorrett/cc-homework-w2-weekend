require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup()
    @sixties_theme_room = Room.new("60s Sensations")
  end

  def test_has_name()
    assert_equal("60s Sensations", @sixties_theme_room.name)
  end

  def test_has_no_guests_at_start()
    assert_equal(0, @sixties_theme_room.guests.count)
  end

  def test_has_no_songs_at_start()
    assert_equal(0, @sixties_theme_room.queued_songs.count)
  end

  def test_can_queue_song()
    @sixties_theme_room.queue_song(@house_of_the_rising_sun)
    assert(@sixties_theme_room.song_queued?(@house_of_the_rising_sun))
  end

  def test_can_dequeue_song()
    @sixties_theme_room.queue_song(@house_of_the_rising_sun)
    @sixties_theme_room.dequeue_song(@house_of_the_rising_sun)
    assert_equal(false, @sixties_theme_room.song_queued?(@house_of_the_rising_sun))
  end

end
