class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = []
    self.each_with_index do |ele, i|
      if i.even?
        add_me = ((ele * 50) / 2) - 4
        result << add_me
      else 
        me_too = ((ele * 25) / 4) - 2
        result << me_too
      end 
    end 
      result.sum 
  end
end

class String
  def hash
    alpha = ("a".."z").to_a + ("A".."Z").to_a
    alpha_idx = []
    self.split("").each { |char| alpha_idx << alpha.index(char) }
    alpha_idx.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = []
    arr = *self.flatten

    arr.each do |ele|
      if !ele.is_a?(Integer)
        result << ele.hash
      else
        result << ele
      end 
    end 
    result.sum
  end
end
