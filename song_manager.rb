class SongManager

  attr_reader :songs

  def initialize(songs_directory)
    if songs_directory
      @songs = []
      Dir[songs_directory + "/*.txt"].each() do |song_file_name|
        new_song = Song.new('Title', 'Artist', 1990, 'Lyrics')
        @songs.push(new_song)
      end
    end
  end

end
