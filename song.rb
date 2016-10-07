require_relative('record')

class Song < Record

  attr_reader :title, :artist, :release_year

  def initialize(title, artist, release_year)

    @title = title
    @artist = artist
    @release_year = release_year

  end

end
