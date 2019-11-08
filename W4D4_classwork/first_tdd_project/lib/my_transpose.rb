class Array

  def my_transpose
    transposed = Array.new(self.length) { Array.new(self.length) }
    self.size.times do |i_1|
      self.size.times .each do |i_2|
        transposed[i_2][i_1] = self[i_1][i_2]
      end 
    end   
    transposed 
  end 

end 

