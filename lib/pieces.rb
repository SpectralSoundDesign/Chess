class Square
  attr_accessor :position, :current_piece, :current_symbol, :occupied

  def initialize(pos)
    @position = pos
    @current_piece = nil
    @current_symbol = " "
    @occupied = false
  end
end

class Pawn
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2659".encode('utf-8')
  end
end

class Knight
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2658".encode('utf-8')
  end
end

class Bishop
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2657".encode('utf-8')
  end
end

class Rook
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2656".encode('utf-8')
  end
end

class King
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2654".encode('utf-8')
  end
end

class Queen
  attr_accessor :symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @symbol = "\u2655".encode('utf-8')
  end
end