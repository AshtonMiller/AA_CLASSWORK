
    

HORIZONTAL = [[1, 0],[0, 1],[-1, 0],[0, -1]]

def moves(pos)
  grid = Array.new(8) { Array.new(8) }
    grid[0] = Array.new(8) { "w" }
    grid[1] = Array.new(8) { "w" }
    grid[2] = Array.new(8) { nil }
    grid[3] = Array.new(8) { nil }
    grid[4] = Array.new(8) { nil }
    grid[5] = Array.new(8) { nil }
    grid[6] = Array.new(8) { "B" }
    grid[7] = Array.new(8) { "B" }

    moves = []
      (0...HORIZONTAL.length).each do |i|
        spot = pos + HORIZONTAL[i]
        x, y = spot
        if grid[x][y] == nil && valid_pos(spot)
          while spot + HORIZONTAL[i] == nil && valid_pos(spot)   
            moves << spot 
            spot += HORIZONTAL[i]
          end 
        end 
      end 
      moves 
  end 

  def valid_pos(pos)
    return true if (pos[0].between?(0, 7) && pos[1].between?(0, 7))
    false
  end 

  p moves([1,0])
  p moves([0,0])
  p moves([0,1])