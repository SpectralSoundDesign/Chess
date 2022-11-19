class Player
  attr_accessor :color, :lost_pieces, :captured_pieces

  def initialize(color)
    @color = color
    @lost_pieces = []
    @captured_pieces = []
  end
end

class Computer
  attr_accessor :color, :lost_pieces, :captured_pieces

  def initialize(color)
    @color = color
    @lost_pieces = []
    @captured_pieces = []
  end
end