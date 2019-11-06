class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    
  end

  
  def bonus(multiplier)
    bonus = (self.salary) * multiplier
  end


end

class Manager < Employee
  attr_accessor :team

  def initialize(name, title, salary, boss = nil, team = [])
    super(name, title, salary, boss)
    @team = team
    # self.load_team(name) where we left off
  end

  def bonus(multiplier)
    total = 0
    team.each { |member| total += member.salary }
    total * multiplier
  end

  # def load_team(person) # where we left off
  #   team << person 
  # end 
end

fe = Employee.new("ted", "TA", 500, "Ronil")
ab = Employee.new("bob", "TA", 500, "Ronil")
cc = Employee.new("alice", "TA", 500, "Ronil")
ro = Manager.new("Ronil", "TA-Manager", 500, "Darren", [ab, cc, fe])


