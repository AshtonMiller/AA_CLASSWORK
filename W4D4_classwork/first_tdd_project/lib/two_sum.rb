


class Array

  def two_sum
    pairs = []
    (0...self.length).each do |i_1|
      (0...self.length).each do |i_2|
        pair = [i_1, i_2].sort
        pairs << pair if (self[i_1] + self[i_2] == 0) && i_2 > i_1
      end 
    end 
    pairs.sort
  end

end 