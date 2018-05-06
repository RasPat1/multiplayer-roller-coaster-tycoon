class Grid
  attr_accessor :grid, :width, :length

  DEFAULT_VALUE = nil

  def initialize(width, length)
    @width = width
    @length = length
    @grid = create_grid
  end

  def create_grid
    Array.new(length) {
      Array.new(width) {
        DEFAULT_VALUE
      }
    }
  end
end