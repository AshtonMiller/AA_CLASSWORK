 require "benchmark"
 require "set"
 require "byebug"
# def bad_two_sum?(arr,target)
#   (0...arr.length).each do |idx1|
#     (0...arr.length).each do |idx2|
#       return true if arr[idx1] + arr[idx2] == target && idx1 < idx2
#     end
#   end
# false

# end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# p Benchmark.measure { bad_two_sum?(arr, 6) }
# p Benchmark.measure { bad_two_sum?(arr, 10) } # => should be false}

def two_sum?(arr, target)
  sorted = arr.sort
  idx = nil
  result = []
  sorted.each_with_index do |num, i| 
    idx = (i + 1) if sorted[i - 1] < target && !sorted[i - 1].nil?
      if sorted[i] > target
        result = sorted.take((idx/2)+1)
        break
      end
  end

  result.each do |ele| 
    if result.index(target-ele).nil?
      return true
    end
  end
    return false
end



# # arr = (3..100000).to_a.shuffle
# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# # p two_sum?(arr, 142) # => should be false
# p two_sum?(arr, 10) # => should be false

# p Benchmark.measure { two_sum?(arr, 6) }
# p Benchmark.measure { two_sum?(arr, 10) } 


def two_sum?(arr, target)
  s1 = arr.to_set
    s1.each do |ele| 
      # debugger
       if s1.find_index(target-ele).nil?
        return true
       end
    end
    return false
end

# # arr = (3..100000).to_a.shuffle
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
# # p two_sum?(arr, 142) # => should be false
p two_sum?(arr, 10) # => should be false

p Benchmark.measure { two_sum?(arr, 6) }
p Benchmark.measure { two_sum?(arr, 10) } 