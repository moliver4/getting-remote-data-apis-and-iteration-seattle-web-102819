def welcome
  puts "Hello!"
end

def get_character_from_user
  puts "please enter a character name"
  name = gets.chomp
  name.downcase
end
