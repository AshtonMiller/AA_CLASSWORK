require_relative "poly_tree_node"

class KnightPathFinder
    attr_reader :root_node
    attr_accessor :considered_positions
    MOVES = [[-2, -1], [-2, 1], [2, -1], [2, 1], [1, -2], [1, 2], [-1, -2], [-1, 2]]
        
    def self.valid_moves(pos)
        row, col = pos
        val_moves = []
        MOVES.each do |move|
            if (row + move[0]).between?(0, 7) && (col + move[1]).between?(0, 7)
                val_moves << [row + move[0], col + move[1]]
            end
        end
        val_moves
 
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree

    end

    def build_move_tree

    end

    def new_move_positions(pos)        
        
        valids = KnightPathFinder.valid_moves(pos)
        
        left_valid_moves = []
        valids.each do |move| 
            unless @considered_positions.include?(move) 
                left_valid_moves << move 
            end
        end
        
        @considered_positions += left_valid_moves
        left_valid_moves       
    end




end

kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]