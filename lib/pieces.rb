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
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2659".encode('utf-8')
    @white_symbol = "\u265F".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    if self.color == 'white'
      if self.move_history.empty?
        valid_moves = [[0, -1], [0, -2]]
      else
        valid_moves = [[0, -1]]
      end
    else
      if self.move_history.empty?
        valid_moves = [[0, 1], [0, 2]]
      else
        valid_moves = [[0, 1]]
      end
    end

    valid_moves.each do |m|
      pos_x = self.current_position[0] + m[0]
      pos_y = self.current_position[1] + m[1]
      
      possible_move_square = find_square([pos_x, pos_y], board_nodes)
      
      if possible_move_square == nil || possible_move_square.occupied == true
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
          self.possible_moves.push(possible_move_square)
          break
        else
          break
        end
      end
      
      unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
      #return position of squares that can be moved to
        if current_player.class.name == "Computer"
          possible_move_square.current_symbol = " "
        else
          possible_move_square.current_symbol = "X"
        end

        self.possible_moves.push(possible_move_square)
      end
    end
  end
end

class Knight
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2658".encode('utf-8')
    @white_symbol = "\u265E".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    valid_moves = [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1], [2, 1], [1, 2]]

    valid_moves.each do |m|
      pos_x = self.current_position[0] + m[0]
      pos_y = self.current_position[1] + m[1]
      
      possible_move_square = find_square([pos_x, pos_y], board_nodes)

      if possible_move_square == nil || possible_move_square.occupied == true
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
          self.possible_moves.push(possible_move_square)
        end
      end
      
      unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
      #return position of squares that can be moved to
        if current_player.class.name == "Computer"
          possible_move_square.current_symbol = " "
        else
          possible_move_square.current_symbol = "X"
        end

        self.possible_moves.push(possible_move_square)
      end
    end
  end
end

class Bishop
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2657".encode('utf-8')
    @white_symbol = "\u265D".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    valid_moves = find_valid_moves

    valid_moves.each do |a|
      a.each do |m|
        pos_x = self.current_position[0] + m[0]
        pos_y = self.current_position[1] + m[1]

        possible_move_square = find_square([pos_x, pos_y], board_nodes)

        if possible_move_square == nil || possible_move_square.occupied == true
          unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
            self.possible_moves.push(possible_move_square)
            break
          else
            break
          end
        end
        
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
        #return position of squares that can be moved to
          if current_player.class.name == "Computer"
            possible_move_square.current_symbol = " "
          else
            possible_move_square.current_symbol = "X"
          end

          self.possible_moves.push(possible_move_square)
        end
      end
    end
  end

  def find_valid_moves
    valid_moves = []
    valid_moves_y = []
    valid_moves_y_neg = []
    valid_moves_x = []
    valid_moves_x_neg = []

    (1..8).each do |i|
      valid_moves_y.push([i * -1, i])
      valid_moves_x.push([i, i])
      valid_moves_y_neg.push([i, i * -1])
      valid_moves_x_neg.push([i * -1, i * -1])
    end

    valid_moves.push(valid_moves_y)
    valid_moves.push(valid_moves_y_neg)
    valid_moves.push(valid_moves_x)
    valid_moves.push(valid_moves_x_neg)

    valid_moves
  end
end

class Rook
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2656".encode('utf-8')
    @white_symbol = "\u265C".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    valid_moves = find_valid_moves

    valid_moves.each do |a|
      a.each do |m|
        pos_x = self.current_position[0] + m[0]
        pos_y = self.current_position[1] + m[1]

        possible_move_square = find_square([pos_x, pos_y], board_nodes)

        if possible_move_square == nil || possible_move_square.occupied == true
          unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
            self.possible_moves.push(possible_move_square)
            break
          else
            break
          end
        end
        
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
        #return position of squares that can be moved to
          if current_player.class.name == "Computer"
            possible_move_square.current_symbol = " "
          else
            possible_move_square.current_symbol = "X"
          end

          self.possible_moves.push(possible_move_square)
        end
      end
    end
  end

  def find_valid_moves
    valid_moves = []
    valid_moves_y = []
    valid_moves_y_neg = []
    valid_moves_x = []
    valid_moves_x_neg = []

    (1..8).each do |i|
      valid_moves_y.push([0, i])
      valid_moves_x.push([i, 0])
      valid_moves_y_neg.push([0, i * -1])
      valid_moves_x_neg.push([i * -1, 0])
    end

    valid_moves.push(valid_moves_y)
    valid_moves.push(valid_moves_y_neg)
    valid_moves.push(valid_moves_x)
    valid_moves.push(valid_moves_x_neg)

    valid_moves
  end
end

class King
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2654".encode('utf-8')
    @white_symbol = "\u265A".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    valid_moves = find_valid_moves

    valid_moves.each do |a|
      a.each do |m|
        pos_x = self.current_position[0] + m[0]
        pos_y = self.current_position[1] + m[1]

        possible_move_square = find_square([pos_x, pos_y], board_nodes)

        if possible_move_square == nil || possible_move_square.occupied == true
          unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
            self.possible_moves.push(possible_move_square)
            break
          else
            break
          end
        end
        
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
        #return position of squares that can be moved to
          if current_player.class.name == "Computer"
            possible_move_square.current_symbol = " "
          else
            possible_move_square.current_symbol = "X"
          end

          self.possible_moves.push(possible_move_square)
        end
      end
    end
  end

  def find_valid_moves
    valid_moves = []
    valid_moves_y = []
    valid_moves_y_neg = []
    valid_moves_x = []
    valid_moves_x_neg = []
    valid_moves_y_diag = []
    valid_moves_x_diag = []
    valid_moves_y_neg_diag = []
    valid_moves_x_neg_diag = []

    valid_moves_y.push([0, 1])
    valid_moves_x.push([1, 0])
    valid_moves_y_neg.push([0, -1])
    valid_moves_x_neg.push([-1, 0])
    valid_moves_y_diag.push([-1, 1])
    valid_moves_x_diag.push([1, 1])
    valid_moves_y_neg_diag.push([1, -1])
    valid_moves_x_neg_diag.push([-1, -1])

    valid_moves.push(valid_moves_y)
    valid_moves.push(valid_moves_y_neg)
    valid_moves.push(valid_moves_x)
    valid_moves.push(valid_moves_x_neg)
    valid_moves.push(valid_moves_y_diag)
    valid_moves.push(valid_moves_y_neg_diag)
    valid_moves.push(valid_moves_x_diag)
    valid_moves.push(valid_moves_x_neg_diag)

    valid_moves
  end
end

class Queen
  include Search
  attr_accessor :black_symbol, :white_symbol, 
  :current_square, :current_position, :color, :possible_moves, :move_history

  def initialize
    @color = nil
    @current_position = nil
    @current_square = nil
    @black_symbol = "\u2655".encode('utf-8')
    @white_symbol = "\u265B".encode('utf-8')
    @possible_moves = []
    @move_history = []
  end

  def find_possible_moves(board_nodes, current_player)
    self.possible_moves = []

    valid_moves = find_valid_moves

    valid_moves.each do |a|
      a.each do |m|
        pos_x = self.current_position[0] + m[0]
        pos_y = self.current_position[1] + m[1]

        possible_move_square = find_square([pos_x, pos_y], board_nodes)

        if possible_move_square == nil || possible_move_square.occupied == true
          unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.nil? || possible_move_square.current_piece.color == current_player.color
            self.possible_moves.push(possible_move_square)
            break
          else
            break
          end
        end
        
        unless pos_x > 8 || pos_y > 8 || pos_y < 1 || pos_x < 1 || possible_move_square.occupied == true
        #return position of squares that can be moved to
          if current_player.class.name == "Computer"
            possible_move_square.current_symbol = " "
          else
            possible_move_square.current_symbol = "X"
          end

          self.possible_moves.push(possible_move_square)
        end
      end
    end
  end

  def find_valid_moves
    valid_moves = []
    valid_moves_y = []
    valid_moves_y_neg = []
    valid_moves_x = []
    valid_moves_x_neg = []
    valid_moves_y_diag = []
    valid_moves_x_diag = []
    valid_moves_y_neg_diag = []
    valid_moves_x_neg_diag = []

    (1..8).each do |i|
      valid_moves_y.push([0, i])
      valid_moves_x.push([i, 0])
      valid_moves_y_neg.push([0, i * -1])
      valid_moves_x_neg.push([i * -1, 0])
    end

    (1..8).each do |i|
      valid_moves_y_diag.push([i * -1, i])
      valid_moves_x_diag.push([i, i])
      valid_moves_y_neg_diag.push([i, i * -1])
      valid_moves_x_neg_diag.push([i * -1, i * -1])
    end

    valid_moves.push(valid_moves_y)
    valid_moves.push(valid_moves_y_neg)
    valid_moves.push(valid_moves_x)
    valid_moves.push(valid_moves_x_neg)
    valid_moves.push(valid_moves_y_diag)
    valid_moves.push(valid_moves_y_neg_diag)
    valid_moves.push(valid_moves_x_diag)
    valid_moves.push(valid_moves_x_neg_diag)

    valid_moves
  end
end