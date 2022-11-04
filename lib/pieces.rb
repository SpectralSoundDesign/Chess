class Square
  attr_accessor :position, :current_piece

  def initialize(pos)
    @position = pos
    @current_piece = nil
    @occupied = false
  end
end

class Pawn
end

class Knight
end

class Bishop
end

class Rook
end

class King
end

class Queen
end