require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Kali Ma", "Neck Deep")
  end

  def test_has_name()
    assert_equal("Kali Ma", @song1.name)
  end

  def test_has_artist()
    assert_equal("Neck Deep", @song1.artist)
  end


  def test_play_song()
    result = @song1.play_song
    assert_equal("Kali Ma by Neck Deep is currently playing", result)
  end

end
