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
    assert_equal(9, @loaded_song_manager.songs().count())
  end

  def test_song_with_title_the_young_ones_loaded_correctly()
    songs = @loaded_song_manager.songs()
    the_young_ones = nil
    songs.each do |song|
      if song.title == "The Young Ones"
        the_young_ones = song
      end
    end
    assert_equal("The Young Ones", the_young_ones.title)
    assert_equal("Cliff Richards", the_young_ones.artist)
    assert_equal(1962, the_young_ones.release_year)
    assert_equal("The young ones, Darlin' we're the young ones. ", the_young_ones.lyrics[0])
  end

end
