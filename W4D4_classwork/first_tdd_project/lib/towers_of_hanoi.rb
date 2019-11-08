class TowersOfHanoi 

  def initialize
    @stacks = [[1,2,3,4],[],[]]
  end

  def move

  end

  def won?
    @stacks == [[],[],[1,2,3,4]]
  end

end