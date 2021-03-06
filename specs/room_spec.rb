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
    @full_room = Room.new("70s Party", 4)

    # songs
    @house_of_the_rising_sun = Song.new("House of the Rising Sun", "The Animals", 1964, ["rising sun lyrics", "more rising sun lyrics"])
    @do_wah_diddy_diddy = Song.new("Do Wah", "Manfred Mann", 1964, ["song lyrics", "more song lyrics", "even more song lyrics"])

    # guests
    @mike_jones = Guest.new(first_name: "Mike", last_name: "Jones", date_of_birth: Date.new(1999, 2, 24), confidence: 15)
    @terry_marx = Guest.new(first_name: "Terry", last_name: "Marx", date_of_birth: Date.new(1992, 3, 1), confidence: 3)
    @sam_torrence = Guest.new(first_name: "Sam", last_name: "Torrence", date_of_birth: Date.new(1996, 1, 2), confidence: 18)
    @ben_james = Guest.new(first_name: "Ben", last_name: "James", date_of_birth: Date.new(1987, 12, 2), confidence: 13)
    @alan_cummings = Guest.new(first_name: "Alan", last_name: "Cummings", date_of_birth: Date.new(1979, 5, 12), confidence: 8)
    @catriona_jeorrett = Guest.new(first_name: "Catriona", last_name: "Jeorrett", date_of_birth: Date.new(1945, 9, 4), confidence: 10)
    @alison_jeorrett = Guest.new(first_name: "Alison", last_name: "Jeorrett", date_of_birth: Date.new(1954, 5, 29), confidence: 20)

    @full_room.add_guest(@mike_jones)
    @full_room.add_guest(@terry_marx)
    @full_room.add_guest(@sam_torrence)
    @full_room.add_guest(@ben_james)
    @full_room.queue_song(@do_wah_diddy_diddy)
    @full_room.queue_song(@house_of_the_rising_sun)
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
    @sixties_theme_room.add_guest(@mike_jones)
    assert_equal(5, @sixties_theme_room.spare_capacity)
    @sixties_theme_room.add_guest(@terry_marx)
    assert_equal(4, @sixties_theme_room.spare_capacity)
    @sixties_theme_room.add_guest(@sam_torrence)
    assert_equal(3, @sixties_theme_room.spare_capacity)
  end

  def test_cant_add_guest_if_room_full()
    assert_equal(false, @full_room.add_guest(@alan_cummings))
    assert_equal(4, @full_room.guests().count())
    assert_equal(false, @full_room.has_guest?(@alan_cummings))
  end

  def test_can_remove_guest()
    @full_room.remove_guest(@mike_jones)
    assert_equal(3, @full_room.guests().count())
    assert_equal(false, @full_room.has_guest?(@mike_jones))
  end

  def test_currently_playing()
    assert("Do Wah", @full_room.currently_playing())
  end

  def test_current_line_initialises_ok()
    assert_equal("song lyrics", @full_room.current_line())
  end

  def test_can_next_line()
    @full_room.next_line()
    assert_equal("more song lyrics", @full_room.current_line())
    @full_room.next_line()
    assert_equal("even more song lyrics", @full_room.current_line())
  end

  def test_progresses_to_next_song()
    3.times do
      @full_room.next_line()
    end
    assert_equal("House of the Rising Sun", @full_room.currently_playing())
    assert_equal("rising sun lyrics", @full_room.current_line())
  end

  def test_get_description()
    @full_room.remove_guest(@mike_jones)
    expected = "70s Party Room
playing: Do Wah
current line: 'song lyrics'
guests:
  Terry Marx(2008, 3.0)
  Sam Torrence(2012, 18.0)
  Ben James(2003, 13.0)"
    assert_equal(expected, @full_room.get_description())
  end

end
