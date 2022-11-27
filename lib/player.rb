class Player
  attr_accessor :color, :lost_pieces, :captured_pieces, :in_check

  def initialize(color)
    @color = color
    @lost_pieces = []
    @captured_pieces = []
    @in_check = false
  end
end

class Computer
  attr_accessor :color, :lost_pieces, :captured_pieces, :in_check

  def initialize(color)
    @color = color
    @lost_pieces = []
    @captured_pieces = []
    @in_check = false
  end
end