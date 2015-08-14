# crowdfund.rb

# A simple text-based app to organize different crowdfunded projects

class Project
  def initialize(name, total=0, goal=1000)
    @name = name
    @total = total
    @goal = goal
  end

  def to_s
    "Project #{@name} has $#{@total} in funding towards a goal of $#{@goal}."
  end

  def lose_funds(total_lost)
    @total -= total_lost
    "Proj #{@name} lost some funds!"
  end

  def gain_funds(total_gained)
    @total += total_gained
    "Proj #{@name} got more funds!"
  end
end

proj1 = Project.new("ABC", 400, 5000)
proj2 = Project.new("DEF", 20, 100)
proj3 = Project.new("GHI", 500, 2000)

puts proj1
puts proj1.lose_funds(200)
puts proj1
puts proj1.gain_funds(700)
puts proj1