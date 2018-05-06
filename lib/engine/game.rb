class Game
  attr_accessor :money, :grid

  WIDTH = 10
  LENGTH = 10

  # This holds the game properties
  def initialize
    @money = 0
    @grid = Grid.new(WIDTH, LENGTH)
  end

end