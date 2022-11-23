require_relative 'pieces.rb'
require_relative 'utilities.rb'
require_relative 'player.rb'
require 'pry'

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
    @player1 = Player.new('white')
    @player2 = Player.new('black')
    @computer = Computer.new('black')
    @current_player = [@player1, @computer]
    @current_white = []
    @current_black = []
  end

  def start
    populate_board
    
    puts ""
    puts "       ================================"
    puts "               WELCOME TO CHESS        "
    puts "       ================================"
    puts "           Please select a gamemode    "
    puts "       --------------------------------"
    puts "             1) Player v Player        "
    puts "             2) Player v Computer      "
    puts "             3) EXIT     "
    puts "       --------------------------------"
    menu_selection = gets.chomp.to_i

    case menu_selection
    when 1
      puts "Generating board..."
      @current_player[1] = @player2
      print_board
      select_piece
    when 2
      puts "Generating board..."
      @current_player[1] = @computer
      print_board
      select_piece
    when 3
      puts "Exiting..."
      exit
    else
      puts "Select an option:"
      start
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
    puts "#{@current_player[0].color}, choose location of piece to move:"

    if @current_player[0].class.name == "Computer"
      @board_nodes.each do |n|
        if n.current_piece.nil? == false && n.current_piece.color == 'black'
          @current_black.push(n.current_piece)
          find_possible_piece_moves(n.current_piece)
        end
      end
      
      computer_piece = @current_black.sample
      
      current_piece = find_piece(computer_piece.current_position, @board_nodes)

      @current_black = []
    else
      find_piece_x = gets.chomp.to_i
      find_piece_y = gets.chomp.to_i

      current_piece = find_piece([find_piece_x, find_piece_y], @board_nodes)
    end

    if current_piece.nil?
      select_piece
    end
    #check if current player can move piece
    if @current_player[0].color != current_piece.color
      puts "Select a valid piece"
      select_piece
    end

    if @current_player[0].class.name == "Player"
      find_possible_piece_moves(current_piece)
    end
    
    unless current_piece.possible_moves.empty?
      print_board

      destination_square = select_possible_move(current_piece)
      piece_destination = destination_square.position

      current_piece.move_history.push(destination_square)

      move_piece(piece_destination, current_piece)
    end

    select_piece
  end

  def move_piece(piece_destination, current_piece)
    desination_square = find_square(piece_destination, @board_nodes)
    current_square = current_piece.current_square

    if desination_square.current_piece.nil? == false && desination_square.current_piece.color != current_piece.color
      @current_player[0].captured_pieces.push(desination_square.current_piece)
      @current_player[1].lost_pieces.push(desination_square.current_piece)
    end

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

    #clear current square
    current_square.current_piece = nil
    current_square.current_symbol = " "
    current_square.occupied = false

    print_board
    @current_player = @current_player.reverse
    select_piece
  end

  def find_possible_piece_moves(current_piece)
    case current_piece.class.name
    when "Pawn"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the pawn"
    when "Knight"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the knight"
    when "Bishop"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the bishop"
    when "Rook"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the rook"
    when "King"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the king"
    when "Queen"
      current_piece.find_possible_moves(@board_nodes, @current_player[0])
      puts "Move the queen"
    else
      "You did not select a piece."
    end
  end

  def select_possible_move(current_piece)
    possible_captures = []
    puts "Pick one of these possible moves:"
      current_piece.possible_moves.each do |n|
        n.current_symbol = " "

        if n.current_piece.nil? == false && n.current_piece.color != @current_player[0].color
          puts "Possible take: #{n.position}"
          possible_captures.push(n)
        else

          print "#{n.position}"
        end
      end

    if @current_player[0].class.name == "Player"
      piece_destination_x = gets.chomp.to_i
      piece_destination_y = gets.chomp.to_i

      piece_destination = [piece_destination_x, piece_destination_y]

      destination_square = find_square(piece_destination, @board_nodes)
    else
      if possible_captures.empty? == false
        piece_destination = possible_captures[0]
      else
        piece_destination = current_piece.possible_moves.sample
      end
      
      destination_square = find_square(piece_destination.position, @board_nodes)
    end
     
    destination_square
  end
end