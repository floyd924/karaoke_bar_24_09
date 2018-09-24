class Song

  attr_reader :name, :artist

  def initialize(name, artist)
    @name = name
    @artist = artist
  end

  def play_song
    return "#{@name} by #{@artist} is currently playing."
  end

end
