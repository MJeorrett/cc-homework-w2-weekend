require_relative('record')

require('pry-byebug')

class Room < Record

  attr_reader :name, :capacity, :queued_songs, :guests

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @queued_songs = []
    @guests = []
    @current_line_number = 0
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
    if spare_capacity() > 0
      @guests.push(guest)
      return true
    else
      return false
    end
  end

  def remove_guest(guest)
    if has_guest?(guest)
      return @guests.delete(guest)
    else
      return false
    end
  end

  def has_guest?(guest)
    @guests.include?(guest)
  end

  def spare_capacity()
    return @capacity - @guests.length()
  end

  def currently_playing()
    return @queued_songs.first().title
  end

  def current_line()
    return @queued_songs.first.lyrics()[@current_line_number]
  end

  def next_line()
    @current_line_number += 1
    if @current_line_number >= @queued_songs.first().lyrics().length()
      @current_line_number = 0
      @queued_songs.shift()
    end
  end

  def get_description()
    description = "#{name} Room
playing: #{currently_playing()}
current line: '#{current_line()}'
guests:
"
    guest_string = @guests.map { |guest| "  " + guest.get_description() }

    return description + guest_string.join("\n")
  end

end
