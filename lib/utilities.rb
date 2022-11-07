module Search
  def find_square(pos, board_nodes)
    i, j = pos
    id = (j * 8) - (i - 1) - 1
    board_nodes[id]
  end

  def find_piece(pos, board_nodes)
    i, j = pos
    id = (j * 8) - (i - 1) - 1
    board_nodes[id].current_piece
  end
end