module GamesHelper
  def list
    @grid.letters.each do |letter|
    '<li>'+ letter + '</li>'
    end
  end
end
