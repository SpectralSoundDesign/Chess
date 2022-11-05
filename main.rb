require_relative 'lib/board.rb'

board = Board.new

board.populate_board
#p board.find_square([1, 2])
#p board.find_piece([1, 2])
board.move_piece