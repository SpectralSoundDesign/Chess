require_relative 'pieces.rb'

class Board
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
        puts "   ================================"
        print " #{count} "

        count += 1
      end
      
      print "| #{n.current_piece} |"
    end

    print "\n"
    puts "   ================================"
    puts "     h   g   f   e   d   c   b   a  "
  end
end