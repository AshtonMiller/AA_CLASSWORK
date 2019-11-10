  require "benchmark"
  def largest_contiguous_subsum(arr)
    max = 0
    (1..arr.length).each do |i|
      arr.each_cons(i) { |nums| max = nums.sum if nums.sum > max }
    end
    max
  end
 list = [2, 3, -6, 7, -6, 7]
  puts largest_contiguous_subsum(list)
  p Benchmark.measure{ largest_contiguous_subsum(list) } 

  def largest_contiguous_subsum(arr)
    best_max = 0
    current = [0]
    
    arr.each do |num|
      if (current[-1] + num) < 0 
        current << 0
      else 
        current << num + current[-1]
      end  
       best_max = current[-1] if current[-1] > best_max
    end 
    best_max > 0 ? best_max : arr.max
  end

  list = [-5, -1, -3]
 
  puts largest_contiguous_subsum(list)
  p Benchmark.measure{ largest_contiguous_subsum(list) } 
  