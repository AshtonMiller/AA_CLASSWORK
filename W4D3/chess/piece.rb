
require_relative "slideable"

class Piece
  attr_reader :board, :pos, :color
  def initialize(color, board, pos) 
    @color = color
    @board = board
    @pos = pos
  end

  
  
  

end 



class Queen < Piece 
  # include Slideable 
  
  # def move_dirs
  #   self.horizontal_dirs + self.diagonal_dirs
  # end 

end 

class SteppingPiece < Piece #knght/king

end 

class NullPiece < Piece #empty space
  # include Singleton 

  # def initialize

  # end

end 

class Pawn < Piece 

end 

