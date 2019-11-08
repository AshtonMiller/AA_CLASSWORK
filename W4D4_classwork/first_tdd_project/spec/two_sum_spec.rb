require "two_sum"

describe "#two_sum" do
  let(:arr_1) { [-1, 0, 2, -2, 1] } 
  let(:sub_1) { [0,4] }
  let(:sub_2) { [2,3] }

  it "can only be called on arrays" do 
    expect{ "".two_sum }.to raise_error(NoMethodError)
  end

  it "finds all indice pairs" do 
    expect(arr_1.two_sum).to include(sub_1, sub_2)
  end

  it "returns the indices pairs in dictionary order" do 
    expect(arr_1.two_sum).to eq([sub_1, sub_2])
  end
end 