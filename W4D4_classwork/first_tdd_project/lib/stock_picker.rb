def stock_picker(prices) 
  raise ArgumentError if prices.length < 2
  largest_pair = nil
  largest_gains = 0

  prices.length.times do |i1|
    (i1+1...prices.length).each do |i2|
      pair = [i1, i2] 
      gains = prices[i2] - prices[i1]
      if gains >= largest_gains
        largest_gains = gains
        largest_pair = pair 
      end 
    end 
  end

  largest_pair 
end