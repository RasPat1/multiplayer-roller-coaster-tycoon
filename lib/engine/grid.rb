class Grid
  attr_accessor :grid

  DEFAULT_VALUE = nil

  def initialize(width, length)
    @grid = create_grid(width, length)
  end

  def create_grid(width, length)
    Array.new(length) {
      Array.new(width) {
        DEFAULT_VALUE
      }
    }
  end
end