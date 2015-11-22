# crowdfund.rb

# A simple text-based app to organize different crowdfunded projects

class Project
  attr_reader :total, :goal
  attr_accessor :name

  def initialize(name, total=0, goal=1000)
    @name = name
    @total = total
    @goal = goal
  end

  def to_s
    "Project #{@name} needs $#{funding_needed} in funding towards a goal of $#{@goal}."
  end

  def lose_funds(total_lost)
    @total -= total_lost
    "Proj #{@name} lost $#{total_lost} in funds!"
  end

  def gain_funds(total_gained)
    @total += total_gained
    "Proj #{@name} gained $#{total_gained} in funds!"
  end

  def funding_needed
    @goal - @total
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

projects = [proj1, proj2, proj3]
puts projects

puts "There are #{projects.size} projects that need to be crowdfunded."

projects.each do |project|
  puts project
  puts "Project #{project.name} has a goal of $#{project.goal}."
  puts project.lose_funds(10)
  puts project.gain_funds(30)
  puts "Project #{project.name} still needs $#{project.funding_needed}."
end
