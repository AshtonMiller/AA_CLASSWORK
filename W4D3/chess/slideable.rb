
module Slideable

  HORIZONTAL = [[1, 0],[0, 1],[-1, 0],[0, -1]] 
  DIAGONAL = [[1, 1],[1, -1],[-1, 1],[-1, -1]]

  def horizontal_dirs
    HORIZONTAL
  end

  def diagonal_dirs
    DIAGONAL
  end

  def hor_moves # just rook moves 
    moves = []
      (0...HORIZONTAL.length).each do |i|
        spot = self.pos + HORIZONTAL[i] # this will give us NOT a pos but an Array of length 4
        if spot == nil && valid_pos(spot)
          while spot + HORIZONTAL[i] == nil && valid_pos(spot)   
            moves << spot 
            spot += HORIZONTAL[i]
          end 
        end 
      end 
      moves 
  end 

  def dia_moves
    moves = []
      (0...DIAGONAL.length).each do |i|
        spot = self.pos + DIAGONAL[i]
        if spot == nil && valid_pos(spot)
          while spot + DIAGONAL[i] == nil && valid_pos(spot)   
            moves << spot 
            spot += DIAGONAL[i]
          end 
        end 
      end 
      moves 

  end 

  def valid_pos(pos)
    return true if (pos[0].between?(0, 7) && pos[1].between?(0, 7))
    false
  end 

end 