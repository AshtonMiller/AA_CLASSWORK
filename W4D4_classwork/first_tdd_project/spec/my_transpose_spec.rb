require "my_transpose"

describe "#my_transpose" do
  let(:arr_1) do 
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
  end

  let(:result) do 
    [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
  end

  it "can only be called on Array class" do
    expect { arr_1.my_transpose }.to_not raise_error
    expect { "hello".my_transpose }.to raise_error(NoMethodError)
  end 

  it "transposes a 2D array" do
    expect(arr_1.my_transpose).to eq(result)
  end
  
  it "all elements of the array are arrays" do
    are_arrays = arr_1.all? { |ele| ele.is_a?(Array) }
    expect(are_arrays).to be(true)
  end

  it "all sub-arrays are the same length" do
    len = arr_1.size
    sub_same_length = arr_1.all? { |ele| ele.size == len }
    expect(sub_same_length).to be(true)
  end

end