require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

require('pry-byebug')

class RoomTest < MiniTest::Test

  def setup()
    # rooms
    @sixties_theme_room = Room.new("60s Sensations", 6)

    # songs
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals", 1964)
    @do_wah_diddy_diddy = Song.new("Do Wah", "Manfred Mann", 1964)

    # guests
    @mike_jones = Guest.new("Mike", "Jones", Date.new(1967, 2, 5))
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
    @sixties_theme_room.queue_song(@do_wah_diddy_diddy)
    @sixties_theme_room.queue_song(@house_of_the_rising_sun)
    assert(@sixties_theme_room.song_queued?(@house_of_the_rising_sun))
  end

  def test_most_recently_queued_song_is_last()
    @sixties_theme_room.queue_song(@do_wah_diddy_diddy)
    @sixties_theme_room.queue_song(@house_of_the_rising_sun)
    assert_equal(@house_of_the_rising_sun, @sixties_theme_room.queued_songs.last)
  end

  def test_can_dequeue_song()
    @sixties_theme_room.queue_song(@house_of_the_rising_sun)
    @sixties_theme_room.dequeue_song(@house_of_the_rising_sun)
    assert_equal(false, @sixties_theme_room.song_queued?(@house_of_the_rising_sun))
  end

  def test_can_add_guest()
    @sixties_theme_room.add_guest(@mike_jones)
    assert(@sixties_theme_room.has_guest?(@mike_jones))
  end

  def test_has_capactiy()
    assert_equal(6, @sixties_theme_room.capacity())
  end

  def test_spare_capacity_initial()
    assert_equal(6, @sixties_theme_room.spare_capacity())
  end

  def test_space_capacity_updates()
    @sixties_theme_room.add_guest(Guest.new("Mike", "Jones", Date.new(1945, 10, 12)))
    assert_equal(5, @sixties_theme_room.spare_capacity)
    @sixties_theme_room.add_guest(Guest.new("Terry", "Marx", Date.new(1992, 12, 20)))
    assert_equal(4, @sixties_theme_room.spare_capacity)
    @sixties_theme_room.add_guest(Guest.new("Matthew", "Jeorrett", Date.new(1986, 10, 30)))
    assert_equal(3, @sixties_theme_room.spare_capacity)
  end

  def test_cant_add_guest_if_room_full()
    for count in (1..6)
      @sixties_theme_room.add_guest(Guest.new("FirstName #{count}", "LastName #{count}", Date.new(1925, 12, 18)))
    end

    assert_equal(false, @sixties_theme_room.add_guest(@mike_jones))
    assert_equal(6, @sixties_theme_room.guests().count())
    assert_equal(false, @sixties_theme_room.has_guest?(@mike_jones))
  end

end
