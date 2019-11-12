require 'rest-client'
require 'json'
require 'pry'

def get_character_info(character_name, hash)
  hash["results"].find {|character| character["name"].downcase == character_name}
end

def get_hash(url)
  JSON.parse(RestClient.get(url))
end

def get_character_movies_from_api(character_name)
  hash = get_hash('http://www.swapi.co/api/people/')
  character = get_character_info(character_name, hash)
  c_films = character["films"]
  new = c_films.map do |url|
    get_hash(url)
  end
end


def print_movies(films)
  films.each_with_index do |film, index| 
    puts "#{index+1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
