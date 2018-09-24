require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../room.rb")
require("pry")

class TestRoom < MiniTest::Test

  def setup
    @guest5 = Guest.new("Alex", "Naughty Sesh", 40)
    @guest6 = Guest.new("Sean", "Priorities", 60)
    @guest7 = Guest.new("skinto", "The Anthem", 6)
    @guest8 = Guest.new("RichyBoi", "golddigga", 500)
    @song5 = Song.new("Online Songs", "Blink-182")
    @song6 = Song.new("Downfall of us all", "A Day To Remember")
    @song7 = Song.new("Naughty Sesh", "Majestic")
    @room5 = Room.new(10, 1000)
  end

  def test_room_has_capacity()
    assert_equal(10, @room5.capacity)
  end

  def test_room_has_money()
    assert_equal(1000, @room5.money)
  end

  # def test_add_guest()
  #   @room5.add_guest(@guest6)
  #   assert_equal(1, @room5.guests.length)
  # end



  def test_add_guests()
    @room5.add_guests(@guest5, @guest6)
    # binding.pry
    assert_equal(2, @room5.guests.length)
  end


  #####test for room not big enough!
  def test_add_guests__room_full()
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
    @room5.add_guests(@guest8)
      # binding.pry
    assert_equal("Sorry, there is not enough space in the room!", @room5.add_guests(@guest5, @guest6))
  end



  # def test_add_song()
  #   @room5.add_song(@song5)
  #   assert_equal(1, @room5.songs.count)
  # end

  def test_add_songs()
    @room5.add_songs(@song5, @song6)
    assert_equal(2, @room5.songs.count)
  end




  def test_list_songs()
    @room5.add_songs(@song7)
    assert_equal("1. Naughty Sesh by Majestic.", @room5.list_songs)
  end

  #test charge guest
  def test_charge_guest__success()
    @room5.charge_guest(@guest5, 23)
    assert_equal(17, @guest5.money)
  end

  def test_charge_customer__not_enough_money()
    result = @room5.charge_guest(@guest5, 800)
    assert_equal("Alex does not have enough money!", result)
  end

  def test_cover_charge__guest()
    @room5.add_guests(@guest5, @guest6)
    assert_equal(37, @guest6.money)
  end

  def test_cover_charge__till()
    @room5.add_guests(@guest5, @guest6)
    assert_equal(1046, @room5.money)
  end

########## guests 7 gets added but not charged
#I would like a way to not add them if they cnt afford it
  def test_guest_cannot_afford_room()
    @room5.add_guests(@guest7)
    assert_equal(6, @guest7.money)
    assert_equal(0, @room5.guests.length)
  end


  def test_list_guests()
    @room5.add_guests(@guest5, @guest6)
    assert_equal(["Alex", "Sean"], @room5.list_guests)
  end

  def test_has_enough_money?()
    assert(@room5.has_enough_money?(@guest7, 5))
  end

  def test_buy_drink()
    @room5.buy_drink(@guest5, 4, "Tennents")
    assert_equal(36, @guest5.money)
    assert_equal(1004, @room5.money)
  end

  def test_buy_drink__not_enough_money()
    @room5.buy_drink(@guest7, 10, "Tennents")
    assert_equal(6, @guest7.money)
    assert_equal(1000, @room5.money)
  end

end
