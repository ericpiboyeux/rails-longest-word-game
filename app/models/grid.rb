class Grid
attr_reader :size, :letters


  def initialize(grid_size)
    @size = grid_size
    @letters = generate(grid_size)
  end

  private

  def generate(grid_size)
    grid_array = []
    letters = ('A'..'Z').to_a
    grid_size.times do |_|
      grid_array << letters.sample
    end
    return grid_array
  end

end
