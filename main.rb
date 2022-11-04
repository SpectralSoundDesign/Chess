require_relative 'lib/board.rb'

board = Board.new

board.populate_board
p board.find_node([1, 1])