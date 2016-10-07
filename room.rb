class Room

  attr_reader :name, :queued_songs, :guests

  def initialize(name)
    @name = name
    @queued_songs = []
    @guests = []
  end

  def queue_song(song)
    @queued_songs.push(song)
  end

  def song_queued?(song)
    
  end

end
