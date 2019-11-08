class Array

  def my_uniq
    self.each_with_index.select {|el, i| !self.take(i).include?(el) }.to_h.keys
    result = []

    self.each do |el|
      result << el unless result.include?(el)
    end

    result
  end

end