require_relative 'pieces.rb'

class Board
  attr_accessor :board_nodes

  def initialize
    @board_nodes = []
    a = *(1..8)
    a.each do |i|
      a.each do |j|
        @board_nodes.push(Square.new([i, j]))
      end
    end
  end

  def print_board
    count = 1

    @board_nodes.each_with_index do |n, i|
      if i % 8 == 0
        print "\n"
        puts "   ========================================"
        print " #{count} "

        count += 1
      end
      
      print "| #{n.current_symbol} |"
    end

    print "\n"
    puts "   ========================================"
    puts "     h    g    f    e    d    c    b    a  "
  end

  def populate_board
    @board_nodes.each_with_index do |n, i|
      if i > 7 && i < 16
        new_pawn = Pawn.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 0 || i == 7
        new_pawn = Rook.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 1 || i == 6
        new_pawn = Knight.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 2 || i == 5
        new_pawn = Bishop.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 3
        new_pawn = Queen.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 4
        new_pawn = King.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i > 47 && i < 56
        new_pawn = Pawn.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 56 || i == 63
        new_pawn = Rook.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 57 || i == 62
        new_pawn = Knight.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 58 || i == 61
        new_pawn = Bishop.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 59
        new_pawn = Queen.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end

      if i == 60
        new_pawn = King.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "black"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.symbol
        n.occupied = true
      end
    end

    print_board
  end

  def find_node(pos)
    i, j = pos
    id = i * 8 + j
    board_nodes[id]
  end
end