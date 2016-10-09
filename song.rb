require_relative('record')

class Song < Record

  attr_reader :title, :artist, :release_year, :lyrics

  def initialize(title, artist, release_year, lyrics)

    @title = title
    @artist = artist
    @release_year = release_year

    raise "lyrics argument is not an Array as expected" if lyrics.class != Array
    @lyrics = lyrics

  end

end
