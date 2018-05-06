module Errors
  class TypeNotRegisteredError < StandardError; end
  class NotEnoughMoneyError < StandardError; end
  class SpaceUnavailbleError < StandardError; end
  class GridAccessOutOfBoundsError < StandardError; end
end