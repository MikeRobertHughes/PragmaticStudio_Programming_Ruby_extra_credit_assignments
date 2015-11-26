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

class Fundraiser

  attr_reader :title

  def initialize(title)
    @title = title
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def report
    puts "There are #{@projects.size} in the group \"#{title}\" that need to be crowdfunded."
    puts @projects

    @projects.each do |project|
      puts project
      puts "Project #{project.name} has a goal of $#{project.goal}."
      puts project.lose_funds(10)
      puts project.gain_funds(30)
      puts "Project #{project.name} still needs $#{project.funding_needed}."
    end
  end
end

proj1 = Project.new("ABC", 400, 5000)
proj2 = Project.new("DEF", 20, 100)
proj3 = Project.new("GHI", 500, 2000)

nonprofits = Fundraiser.new("Nonprofit Projects")
nonprofits.add_project(proj1)
nonprofits.add_project(proj2)
nonprofits.add_project(proj3)
nonprofits.report
