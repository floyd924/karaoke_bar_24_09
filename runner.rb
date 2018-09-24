require_relative("./guest.rb")
require_relative("./song.rb")
require_relative("./room.rb")


loop do

  puts " "
  puts "enter a command from the function list and press enter:"
  # puts "-- Type 'create room' to create a new room."
  # puts "-- Type 'create song' to create a new song."
  # puts "-- Type 'create guest' to create a new guest."
  puts " "
  puts "To close the app at the end of the day, type 'end'"
  puts " "

  choice = gets.chomp.downcase
  case choice

  when 'end'
    puts "thank you for using Iain's bangin karaoke system software!"
    puts " "
    puts " "

  when 'create room'
    puts "What is the ID of this room? (no spaces plz)"
    room_name = gets.chomp
    # puts room_name
    puts "what is the capacity of this room?"
    cap = gets.chomp.to_i
    # puts cap
    puts "how much money does the till start with?"
    till = gets.chomp.to_i
    # puts till
    room_name = Room.new(cap, till)
    puts " "
    puts " This room was created with capacity #{room_name.capacity} and a float of #{room_name.money}"
    # puts room_name
    puts " "


  when 'create song'
    puts "What's the ID of the song? (no spaces plz)"
    song_ID = gets.chomp
    puts "What's the name of the song?"
    song_name = gets.chomp
    puts "Who's it by?"
    song_artist = gets.chomp
    song_ID = Song.new(song_name, song_artist)
    puts " "
    puts "#{song_ID.name} by #{song_ID.artist} has been added!"
    puts " "


  when 'create guest'
    puts "What's the ID of this guest? (no spaces plz)"
    guest_ID = gets.chomp
    puts "What's the name of the guest?"
    guest_name = gets.chomp
    puts "What's the title of #{guest_name}'s favourite song?"
    favourite_song = gets.chomp
    puts "how much money do they have?"
    guest_cash = gets.chomp.to_i
    puts " "
    guest_ID = Guest.new(guest_name, favourite_song, guest_cash)
    puts "#{guest_ID.name} has been created, with £#{guest_ID.money}"
    puts " "

  when 'list rooms'
    ObjectSpace.each_object(Room) {|room| p room}

  when 'list guests'
    ObjectSpace.each_object(Guest) {|guest| puts guest.name}

  when 'list songs'
    ObjectSpace.each_object(Song) {|song| puts "#{song.name} by #{song.artist}"}

  # when 'add guests to room'
  #   puts "Which room do you want to add people to? (Room ID)"
  #   room_to_fill = gets.chomp
  #   puts "Who do you want to add to the room? (guest ID, guest ID)"
  #   guests_to_add = gets.chomp
  #   room_to_fill.add_guests(guests_to_add)
  #   puts " "
    #########gonna need to add a 'name' attribute to the rooms so we can address them by name



  else
    puts "Sorry, I didn't understand you."
  end

  break if choice == "end"

end
