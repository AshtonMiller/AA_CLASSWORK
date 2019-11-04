class PolyTreeNode
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        unless parent == nil
            parent.children.delete(self)
        end
        @parent = node
        node.children << self unless node == nil
    end

    def add_child(child_node)
        child_node.parent=(self) 
    end
    
    def remove_child(child_node)
        raise "not a child" unless self.children.include?(child_node)
        child_node.parent = nil
    end 

    def dfs(target_val)
        return self if self.value == target_val
        return nil if self.children.empty?

        self.children.each do |child|
            result = child.dfs(target_val)
            return result if result != nil 
        end 
        nil 
    end

    def bfs(target_val)
        queue = [self]

        until queue.empty?
            return queue[0] if queue[0].value == target_val
            queue += queue[0].children
            queue.shift
        end

        nil
    end

    

end

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")



