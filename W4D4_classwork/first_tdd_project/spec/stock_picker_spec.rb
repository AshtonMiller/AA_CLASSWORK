require "stock_picker"

describe "#stock_picker" do
  let(:stock_prices) { [100, 5, 20, 40, 50, 10000, 10, 3, 20000, 400] }

  it "should correctly select the best best buy and sell date" do
    expect(stock_picker(stock_prices)).to eq([7, 8]) 
  end

  
  it "argument must be of length greater than 2" do
    expect { stock_picker([1]) }.to raise_error(ArgumentError)
    expect { stock_picker([]) }.to raise_error(ArgumentError)
  end

  it "should return nil if there is no opportunity for gains" do
    expect(stock_picker([4, 3, 2, 1])).to eq(nil) 
  end


end