require_relative "piece"
require "byebug"
class Board
  attr_reader :grid 
  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def add_piece(pos, piece)
    @grid[pos] = piece
  end

  def move_piece(start_pos, end_pos) 
    if (self.valid_pos(start_pos) && self.valid_pos(end_pos)) && (self[start_pos] != nil && self[end_pos] == nil) 
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    else
      raise "Invalid position"
    end
  end

  def valid_pos(pos)
    return true if (pos[0].between?(0, 7) && pos[1].between?(0, 7))
    false
  end
  
  def populate 
    @grid[0].each_with_index do |ele, i|
      @grid[0][i] = Piece.new(:W, self, [0, i])
    end 
    @grid[1].each_with_index do |ele, i|
      @grid[1][i] = Piece.new(:W, self, [1, i])
    end 
    @grid[6].each_with_index do |ele, i|
      @grid[6][i] = Piece.new(:B, self, [6, i])
    end 
     @grid[7].each_with_index do |ele, i|
      @grid[7][i] = Piece.new(:B, self, [7, i])
    end 
  end

end





