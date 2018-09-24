require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require("pry")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Iain", "Kali Ma", 100)
    @song1 = Song.new("Holiday", "Green Day")
    @song2 = Song.new("Kali Ma", "Neck Deep")
  end

  def test_has_name()
    assert_equal("Iain", @guest1.name())
  end

  def test_has_fav_song()
    assert_equal("Kali Ma", @guest1.fav_song())
  end

  def test_has_money()
    assert_equal(100, @guest1.money())
  end

  def test_update_fav_song()
    @guest1.update_fav_song("Happy Judgement Day")
    assert_equal("Happy Judgement Day", @guest1.fav_song)
  end

  def test_sing()
    assert_equal("Iain is singing!", @guest1.sing)
  end

  def test_sing_song
    result = @guest1.sing_song(@song1)
    assert_equal("Holiday by Green Day is currently playing. Iain is singing!", result)
  end

  # def test_sing_song__is_a_banger
  #   result = @guest1.sing_song(@song2)
  #   assert_equal("Kali Ma by Neck Deep is currently playing. Iain is singing! Iain thinks this is a banger!!", result)
  # end

  def test_sing_song_is_banger
    result = @guest1.sing_song(@song2)
    assert_equal("Kali Ma by Neck Deep is currently playing. Iain is singing! Iain thinks this is a banger!!!", result)
  end






end
