class Guest

  attr_reader :name
  attr_accessor :fav_song, :money

#maybe try putting money in reader then try to edit it
  def initialize(name, fav_song, money)
    @name = name
    @fav_song = fav_song
    @money = money
  end

  def update_fav_song(new_song)
    @fav_song = new_song
  end

  def sing()
    return "#{@name} is singing!"
  end


  def sing_song(song)
    if song.name == @fav_song
      return song.play_song + " " + sing + " #{@name} thinks this is a banger!!!"
    else
      return song.play_song + " " + sing
    end
  end



end
