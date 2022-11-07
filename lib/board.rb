require_relative 'pieces.rb'
require_relative 'utilities.rb'

class Board
  include Search
  attr_accessor :board_nodes

  def initialize
    @board_nodes = []
    a = *(1..8)
    a.each do |i|
      a.reverse_each do |j|
        @board_nodes.push(Square.new(j, i))
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
        n.current_symbol = new_pawn.black_symbol
        n.occupied = true
      end

      if i == 0 || i == 7
        new_rook = Rook.new
        new_rook.current_square = n
        new_rook.current_position = n.position
        new_rook.color = "black"
        n.current_piece = new_rook
        n.current_symbol = new_rook.black_symbol
        n.occupied = true
      end

      if i == 1 || i == 6
        new_knight = Knight.new
        new_knight.current_square = n
        new_knight.current_position = n.position
        new_knight.color = "black"
        n.current_piece = new_knight
        n.current_symbol = new_knight.black_symbol
        n.occupied = true
      end

      if i == 2 || i == 5
        new_bishop = Bishop.new
        new_bishop.current_square = n
        new_bishop.current_position = n.position
        new_bishop.color = "black"
        n.current_piece = new_bishop
        n.current_symbol = new_bishop.black_symbol
        n.occupied = true
      end

      if i == 3
        new_queen = Queen.new
        new_queen.current_square = n
        new_queen.current_position = n.position
        new_queen.color = "black"
        n.current_piece = new_queen
        n.current_symbol = new_queen.black_symbol
        n.occupied = true
      end

      if i == 4
        new_king = King.new
        new_king.current_square = n
        new_king.current_position = n.position
        new_king.color = "black"
        n.current_piece = new_king
        n.current_symbol = new_king.black_symbol
        n.occupied = true
      end

      if i > 47 && i < 56
        new_pawn = Pawn.new
        new_pawn.current_square = n
        new_pawn.current_position = n.position
        new_pawn.color = "white"
        n.current_piece = new_pawn
        n.current_symbol = new_pawn.white_symbol
        n.occupied = true
      end

      if i == 56 || i == 63
        new_rook = Rook.new
        new_rook.current_square = n
        new_rook.current_position = n.position
        new_rook.color = "white"
        n.current_piece = new_rook
        n.current_symbol = new_rook.white_symbol
        n.occupied = true
      end

      if i == 57 || i == 62
        new_knight = Knight.new
        new_knight.current_square = n
        new_knight.current_position = n.position
        new_knight.color = "white"
        n.current_piece = new_knight
        n.current_symbol = new_knight.white_symbol
        n.occupied = true
      end

      if i == 58 || i == 61
        new_bishop = Bishop.new
        new_bishop.current_square = n
        new_bishop.current_position = n.position
        new_bishop.color = "white"
        n.current_piece = new_bishop
        n.current_symbol = new_bishop.white_symbol
        n.occupied = true
      end

      if i == 59
        new_queen = Queen.new
        new_queen.current_square = n
        new_queen.current_position = n.position
        new_queen.color = "white"
        n.current_piece = new_queen
        n.current_symbol = new_queen.white_symbol
        n.occupied = true
      end

      if i == 60
        new_king = King.new
        new_king.current_square = n
        new_king.current_position = n.position
        new_king.color = "white"
        n.current_piece = new_king
        n.current_symbol = new_king.white_symbol
        n.occupied = true
      end
    end

    print_board
  end

  def select_piece
    puts "Choose location of piece to move:"
    find_piece_x = gets.chomp.to_i
    find_piece_y = gets.chomp.to_i

    current_piece = find_piece([find_piece_x, find_piece_y], @board_nodes)

    case current_piece.class.name
    when "Pawn"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the pawn"
    when "Knight"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the knight"
    when "Bishop"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the bishop"
    when "Rook"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the rook"
    when "King"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the king"
    when "Queen"
      current_piece.find_possible_moves(@board_nodes)
      puts "Move the queen"
    else
      "You did not select a piece."
    end
    
    unless current_piece.possible_moves.empty?
      puts "Pick one of these possible moves:"
      current_piece.possible_moves.each do |n|
        puts "#{n.position}"
      end

      piece_destination_x = gets.chomp.to_i
      piece_destination_y = gets.chomp.to_i
      piece_destination = [piece_destination_x, piece_destination_y]

      move_piece(piece_destination, current_piece)
    end
  end

  def move_piece(piece_destination, current_piece)
    desination_square = find_square(piece_destination, @board_nodes)
    current_square = current_piece.current_square

    #update destination square and connect to current piece
    current_piece.current_square = desination_square
    current_piece.current_position = desination_square.position
    desination_square.current_piece = current_piece

    if current_square.current_symbol == current_piece.white_symbol
      desination_square.current_symbol = current_piece.white_symbol
    else
      desination_square.current_symbol = current_piece.black_symbol
    end

    desination_square.occupied = true

    #clear curremt square
    current_square.current_piece = nil
    current_square.current_symbol = " "
    current_square.occupied = false

    print_board
    current_board_state
    select_piece
  end

  def current_board_state
    current_board = @board_nodes
    count = 1

    current_board.each_with_index do |n, i|
      if i % 8 == 0
        print "\n"
        puts "   ========================================================================"
        print " #{count} "

        count += 1
      end
      
      if n.current_piece == nil
        print "|  nil  |"
      elsif n.current_piece.color == "white"
        case n.current_piece.class.name
        when "Pawn"
          print "| #{n.current_piece.class.name[0]} + 1 |"
        when "Knight"
          print "| #{n.current_piece.class.name[0]} + 2 |"
        when "Bishop"
          print "| #{n.current_piece.class.name[0]} + 3 |"
        when "Rook"
          print "| #{n.current_piece.class.name[0]} + 5 |"
        when "King"
          print "| #{n.current_piece.class.name[0]} + 10 |"
        when "Queen"
          print "| #{n.current_piece.class.name[0]} + 9 |"
        else
          "You did not select a piece."
        end
      elsif n.current_piece.color == "black"
        case n.current_piece.class.name
        when "Pawn"
          print "| #{n.current_piece.class.name[0]} - 1 |"
        when "Knight"
          print "| #{n.current_piece.class.name[0]} - 2 |"
        when "Bishop"
          print "| #{n.current_piece.class.name[0]} - 3 |"
        when "Rook"
          print "| #{n.current_piece.class.name[0]} - 5 |"
        when "King"
          print "| #{n.current_piece.class.name[0]} - 10 |"
        when "Queen"
          print "| #{n.current_piece.class.name[0]} - 9 |"
        else
          "You did not select a piece."
        end
      end
    end

    print "\n"
    puts "   ========================================================================"
    puts "     h    g    f    e    d    c    b    a  "
  end
end