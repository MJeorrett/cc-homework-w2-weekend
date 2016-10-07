require_relative('record')

require('pry-byebug')

class Room < Record

  attr_reader :name, :capacity, :queued_songs, :guests

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @queued_songs = []
    @guests = []
  end

  def queue_song(song)
    @queued_songs.push(song)
  end

  def song_queued?(song)
    return @queued_songs.include?(song)
  end

  def dequeue_song(song)
    if song_queued?(song)
      return @queued_songs.delete(song)
    else
      return false
    end
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def has_guest?(guest)
    @guests.include?(guest)
  end

  def spare_capacity()
    return @capacity - @guests.length()
  end

end
