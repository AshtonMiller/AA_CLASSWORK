require "benchmark"

def my_min(arr)
  arr.min
  # min = [0]
  # arr.each do |num_1|
  #   min[0] = num_1 if min[0] > num_1 
  # end 
  # min[0]
end


list = (0..999999).to_a.shuffle
p my_min(list)
p Benchmark.measure{ my_min(list) } 
  
  
  
  
