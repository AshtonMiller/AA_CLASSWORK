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
        @considered_positions = [start_pos] # already been here can't go agian
        self.build_move_tree

    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            current_node = queue.shift
            new_move_positions(current_node.value).each do |next_move|
                current_move = PolyTreeNode.new(next_move)
                current_node.add_child(current_move)
                queue << current_move # if @considered_positions.include?(current_move.value)
            end 
        end 

    end

    def new_move_positions(pos) # pos is current position         
        
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

    def find_path(end_pos)
        queue = [@root_node]
        visited = []

        until queue.empty?
            current_node = queue.shift
            result = current_node if current_node.value == end_pos 
            current_node.children.each do |child|
                queue << child if !visited.include?(child) 
                visited << child if !visited.include?(child) 
            end 
        end 
        self.trace_path_back(result) 
    end

    def trace_path_back(node) 
        current_node = node
        path = []
        until current_node.nil?
            path.unshift(current_node.value)
            current_node = current_node.parent
        end 
        path 

    end



end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]