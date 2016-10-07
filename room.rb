class Room

  attr_reader :name, :queued_songs, :guests

  def initialize(name)
    @name = name
    @queued_songs = []
    @guests = []
  end

end
