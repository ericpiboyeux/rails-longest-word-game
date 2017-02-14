class Word
attr_accessor :word

def initialize
  @word
end

def size
  self.word.size
end

def in_dictionary?
  words = File.read('/usr/share/dict/words').upcase.split("\n")
  unless words.include?(self.word.upcase)
    return false
  end
  return true
end

def traduce
  #require 'json'
  #require 'open-uri'

  attempt = self.word

  systran_apikey = '9132a95f-8c15-4df3-8b07-38a3d2a5e985'
  json_req = "https://api-platform.systran.net/translation/text/translate?source=en&target=fr&key=#{systran_apikey}&input=#{attempt}"

  systran_output = open(json_req).read
  json_hash = JSON.parse(systran_output)
  return json_hash["outputs"][0]["output"]
end

def is_valid_word?(grid)
  grid_array = grid.letters
  attempt_array = self.word.upcase.split("")
  #byebug
  attempt_array.each do |letter|
    if grid_array.include?(letter)
      grid_array.delete_at(grid_array.index(letter))
    else
      return false
    end
  end

  return true
end


end
