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



end
