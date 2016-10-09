require_relative('record')

class Song2 < Record

  attr_reader :title, :artist, :release_year, :lyrics

  def initialize(title, artist, release_year, lyrics)

    @title = title
    @artist = artist
    @release_year = release_year
    @lyrics = lyrics

  end

end
