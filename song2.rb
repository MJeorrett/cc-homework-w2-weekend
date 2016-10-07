require_relative('record')

class Song2 < Record

  attr_reader :title, :artist

  def initialize(title, artist)

    @title = title
    @artist = artist

  end

end
