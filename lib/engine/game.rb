class Game
  attr_accessor :money, :grid, :item_types

  WIDTH = 10
  LENGTH = 10
  STARTING_MONEY = 10000

  # This holds the game properties
  def initialize
    @money = STARTING_MONEY
    @grid = Grid.new(WIDTH, LENGTH)
  end

  # Create a item in the specified location
  def construct(x, y, item_type)
    item = Item.new(item_type)

    raise Errors::SpaceUnavailbleError.new unless can_build?(x,y)
    raise Errors::NotEnoughMoneyError.new unless can_afford?(item)

    # currently all items are 1x1
    grid.grid[x][y] = item

    # This has to be marked as self.money not money and i'm not sure why
    self.money -= item.cost
  end

  # Destroy a item. You don't get your moeny back
  def raze(x,y)
    set(x, y, nil)
  end

  def get(x,y)
    raise Errors::GridAccessOutOfBoundsError.new if out_of_bounds?(x,y)
    grid.grid[x][y]
  end

  def set(x,y, value)
    raise Errors::GridAccessOutOfBoundsError.new if out_of_bounds?(x,y)
    grid.grid[x][y] = value
  end

  def can_build?(x,y)
    space_empty?(x,y)
  end

  def can_afford?(item)
    money >= item.cost
  end

  def space_empty?(x,y)
    get(x, y) == nil
  end

  def out_of_bounds?(x,y)
    x < 0 || x > grid.length || y < 0 || y > grid.width
  end

end