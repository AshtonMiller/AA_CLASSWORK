


class Piece

  def initialize(color, board, pos) 
    @color = color
    @board = board
    @pos = pos
  end

end 

class SlidingPiece < Piece #bishop/rook/queen

end 

class SteppingPiece < Piece #knght/king

end 

class NullPiece < Piece #empty space

end 

class Pawn < Piece 

end 

