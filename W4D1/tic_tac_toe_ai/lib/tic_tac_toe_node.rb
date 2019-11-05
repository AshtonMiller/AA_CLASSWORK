require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.won? && evaluator == @next_mover_mark
    return false if @board.tied? || (@board.won? && evaluator != @next_mover_mark)
 
     
    if @next_mover_mark == evaluator
      return self.children.all? { |child| child.losing_node?(evaluator) }
    else 
      return self.children.any? { |child| child.losing_node?(evaluator) }
    end 
      

  end

  def winning_node?(evaluator)
    return true if @board.won? && evaluator != @next_mover_mark
    return false if @board.tied? || (@board.won? && evaluator == @next_mover_mark)

    if @next_mover_mark != evaluator
        return self.children.all? { |child| child.winning_node?(evaluator) }
    else 
        return self.children.any? { |child| child.winning_node?(evaluator) }
    end 
   
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_array = []
    (0...@board.rows.length).each do |i|
      (0...@board.rows.length).each do |j|
        if @board.empty?([i,j])         
          new_board = @board.dup
          new_board[[i,j]] = @next_mover_mark
          @next_mover_mark == :x ? mark = :o : mark = :x
          child = TicTacToeNode.new(new_board, mark, [i, j]) 
          children_array << child
        end
      end
    end
    children_array
  end

  
end
