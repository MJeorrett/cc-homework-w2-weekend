require('minitest/autorun')
require('minitest/rg')
require_relative('../song_manager')
require_relative('../song')

require('pry-byebug')

class SongManagerTest < MiniTest::Test

  def setup()
    @loaded_song_manager = SongManager.new("test_data/songs")
  end

  def test_song_manager_has_correct_number_of_songs()
    assert_equal(8, @loaded_song_manager.songs().count())
  end

  def test_anyone_who_had_a_heart_loaded_correctly()
    songs = @loaded_song_manager.songs()
    had_a_heart = nil
    songs.each do |song|
      if song.title == "Anyone Who had a Heart"
        had_a_heart = song
      end
    end
    assert_equal("Anyone Who had a Heart", had_a_heart.title)
    assert_equal("Cilla Black", had_a_heart.artist)
    assert_equal(1964, had_a_heart.release_year)
    assert_equal("Anyone who ever loved, could look at me", had_a_heart.lyrics.first)
    assert_equal("Why won't you", had_a_heart.lyrics.last)
  end

  def test_young_ones_loaded_correctly()
    songs = @loaded_song_manager.songs()
    young_ones = nil
    songs.each do |song|
      if song.title == "The Young Ones"
        young_ones = song
      end
    end
    assert_equal("The Young Ones", young_ones.title)
    assert_equal("Cliff Richards", young_ones.artist)
    assert_equal(1962, young_ones.release_year)
    assert_equal("The young ones,", young_ones.lyrics.first)
    assert_equal("Darling, we're the young ones.", young_ones.lyrics.last)
  end

  def test_walking_back_to_happiness_loaded_correctly()
    songs = @loaded_song_manager.songs()
    walking_back = nil
    songs.each do |song|
      if song.title == "Walking Back to Happiness"
        walking_back = song
      end
    end
    assert_equal("Walking Back to Happiness", walking_back.title)
    assert_equal("Helen Shapiro", walking_back.artist)
    assert_equal(1961, walking_back.release_year)
    assert_equal("Funny, but it's true", walking_back.lyrics.first)
    assert_equal("Walking back to happiness again", walking_back.lyrics.last)
  end

end
