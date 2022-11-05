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
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2659".encode('utf-8')
    @white_symbol = "\u265F".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
    #possible moves
    valid_moves = [2, 0]

    #get current_piece position and add the valid moves.
    x, y = self.current_position
    dest_x = x - valid_moves[0]
    dest_y = y + valid_moves[1]
    #get the square node of that position and check if it is occupied
    id = (dest_x - 1) * 8 + (dest_y - 1)
    current_square = board_nodes[id]

    if current_square.occupied == false
      self.possible_moves.push(current_square)
    end
  end
end

class Knight
  attr_accessor :black_symbol, :white_symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2658".encode('utf-8')
    @white_symbol = "\u265E".encode('utf-8')
  end
end

class Bishop
  attr_accessor :black_symbol, :white_symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2657".encode('utf-8')
    @white_symbol = "\u265D".encode('utf-8')
  end
end

class Rook
  attr_accessor :black_symbol, :white_symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2656".encode('utf-8')
    @white_symbol = "\u265C".encode('utf-8')
  end
end

class King
  attr_accessor :black_symbol, :white_symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2654".encode('utf-8')
    @white_symbol = "\u265A".encode('utf-8')
  end
end

class Queen
  attr_accessor :black_symbol, :white_symbol, :current_square, :current_position, :color

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2655".encode('utf-8')
    @white_symbol = "\u265B".encode('utf-8')
  end
end