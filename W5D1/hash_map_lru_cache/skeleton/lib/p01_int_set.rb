class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num <= @store.length && num > 0 && !include?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end

  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    else
      return false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)    
    if !include?(num)
      if @count == @num_buckets
        resize!
      end
      self[num] << num
      @count += 1
      return true 
    end 
    false 
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets = @num_buckets * 2
    # @old_store = deep_dup(@store)
    @old_store = @store
    @store = Array.new(@num_buckets) { Array.new }
    @count = 0
    @old_store.each do |subArr|
      subArr.each do |ele|
        insert(ele)
      end 
    end 
  end

    # def deep_dup(arr)
    #   arr.map {|ele| ele.is_a?(Array) ? deep_dup(ele) : ele }
    # end 

end






