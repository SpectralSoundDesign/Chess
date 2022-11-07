require 'pry'
require_relative 'utilities.rb'

class Square
  include Search
  attr_accessor :position, :current_piece, :current_symbol, :occupied

  def initialize(x_cor = nil, y_cor = nil)
    @position = [x_cor, y_cor]
    @current_piece = nil
    @current_symbol = " "
    @occupied = false
  end
end

class Pawn
  include Search
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
    p self.current_position
  end
end

class Knight
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2658".encode('utf-8')
    @white_symbol = "\u265E".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
  end
end

class Bishop
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2657".encode('utf-8')
    @white_symbol = "\u265D".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
  end
end

class Rook
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2656".encode('utf-8')
    @white_symbol = "\u265C".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
    p self.current_position
    p self.color

    possible_move_square = find_square([8, 6], board_nodes)
    #return position of squares that can be moved to
    self.possible_moves.push(possible_move_square)
  end
end

class King
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2654".encode('utf-8')
    @white_symbol = "\u265A".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
  end
end

class Queen
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2655".encode('utf-8')
    @white_symbol = "\u265B".encode('utf-8')
    @possible_moves = []
  end

  def find_possible_moves(board_nodes)
  end
end