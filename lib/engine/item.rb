class Item
  attr_accessor :type

  def initialize(type)
    raise Errors::TypeNotRegisteredError.new unless available_types.include?(type)
    @type = type
  end

  # The availble store types
  def available_types
    # TODO pull this from DB or config
    [
      :kiosk,
      :ride,
      :store,
      :restaurant
    ]
  end

  # The cost to build each store
  def cost
    # Todo pull this from the DB
    1000
  end

  # A more readable version of each type
  def name
    type.to_s.capitalize
  end

  # Currently all stores are 1x1
  def footprint
    # TODO: Use this when putting things into the grid.
    # Careful this is a dependency
  end
end