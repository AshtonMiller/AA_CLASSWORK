require "my_uniq"

describe "#my_uniq" do
  it 'it can only be called on arrays' do
    expect { "hello".my_uniq }.to raise_error(NoMethodError)
  end

  it 'returns all the uniq elments in an array' do
    expect([1,1,2,2,3,3].my_uniq).to eq([1,2,3])
  end
end