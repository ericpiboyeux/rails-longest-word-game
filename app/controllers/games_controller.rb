class GamesController < ApplicationController
  def game

    @grid = Grid.new(9)
    $current_grid = @grid
    $start_time = Time.now

  end



  def score
    game_time = (Time.now - $start_time).round
    @attempt = Word.new
    @attempt.word = params[:attempt]
    @score = 0
    @grid = $current_grid

    if @attempt.is_valid_word?($current_grid)
      @score += 2
    end

    if @attempt.in_dictionary? && @score > 0
      @traduction = @attempt.traduce
      @score += @attempt.size
    end
    @bonus_point = 10 - game_time if game_time < 11
  end




end
