require "benchmark"
# def anagram?(str1, str2)
#   hash1 = Hash.new(0)
#   hash2 = Hash.new(0)
#   str1.each_char { |ele| hash1[ele] += 1}
#   str2.each_char { |ele| hash2[ele] += 1}
#   hash1 == hash2
# end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true
# Benchmark.measure { anagram?( "gizmo", "sally")}
# Benchmark.measure { anagram?( "elvis", "lives")}
# require "byebug"

# def anagram?(str1, str2)
#   str1.each_char do |char|
#     # debugger
#     idx = str2.chars.find_index(char)
#     return false if idx.nil?
#     str2[idx] = ""
#   end
#   true
# end
# yes = ("a".."z").to_a.join("")
# mixed = yes = ("a".."z").to_a.shuffle.join("")
# p anagram?(yes, mixed)    #=> false
# p anagram?("ellvis", "llives")    #=> true
# p Benchmark.measure { anagram?( yes, mixed)}
# p Benchmark.measure { anagram?( "elvis", "lives")}




# def anagram?(str1, str2)
#   str1.chars.sort == str2.chars.sort
# end 

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("ellvis", "llives")    #=> true
# p Benchmark.measure { anagram?( "gizmo", "sally")}
# p Benchmark.measure { anagram?( "elvis", "lives")}


# phase 1

def anagram?(str1, str2)
  str1
    .chars
    .permutation(str1
    .length)
    .to_a.sort == 

    str2
    .chars.permutation(str2
    .length)
    .to_a.sort
end
p anagram?("gizmo", "sally")    #=> false
p anagram?("ellvistyui", "llivestyui")    #=> true
p Benchmark.measure { anagram?( "gizmo", "sally")}
p Benchmark.measure { anagram?( "elvis", "lives")}
