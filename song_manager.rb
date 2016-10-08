require('pry-byebug')

class SongManager

  attr_reader :songs

  def initialize(songs_directory)
    if songs_directory
      @songs = []
      Dir[songs_directory + "/*.txt"].each() do |song_file_name|

        file_lines = File.open(song_file_name).read.lines

        title = remove_label(file_lines[0])
        artist = remove_label(file_lines[1])
        release_year = remove_label(file_lines[2]).to_i
        lyrics = file_lines[4..-1]

        lyrics.each { |line| line.chomp! }

        new_song = Song.new(title, artist, release_year, lyrics)
        @songs.push(new_song)
      end
    end
  end

  private

  def remove_label(line)
    colon_index = line.index(':')
    length = line.length - colon_index - 1
    return line.slice(colon_index + 1, length).chomp.lstrip
  end

end
