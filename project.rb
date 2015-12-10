require_relative 'pledge_type'

class Project
  attr_reader :total, :goal
  attr_accessor :name

  def initialize(name, total=0, goal=1000)
    @name = name
    @total = total
    @goal = goal
    @pledges_received = Hash.new(0)
  end

  def self.from_csv(line)
    name, total = line.split(",")
    Project.new(name, Integer(total))
  end

  def each_pledge_received
    @pledges_received.each do |color, amount|
      yield Pledge.new(color, amount)
    end
  end

  def pledge_received(pledge)
    @pledges_received[pledge.color] += pledge.amount
    puts "Project #{@name} received a #{pledge.color} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@pledges_received}"
  end

  def to_s
    "Project #{@name} needs $#{funding_needed} in funding, has a goal of $#{@goal} and has received $#{funding} in pledges."
  end

  def <=>(other_project)
    other_project.funding_needed <=> funding_needed
  end

  def lose_funds
    @total -= 15
    "Proj #{@name} lost funds!"
  end

  def gain_funds
    @total += 25
    "Proj #{@name} gained funds!"
  end

  def total_funding
    @total + funding
  end

  def funding_needed
    @goal - total_funding
  end

  def funding
    @pledges_received.values.reduce(0, :+)
  end
end

if __FILE__ == $0
  proj = Project.new("ABC", 400, 5000)
  puts proj
  puts proj.lose_funds(200)
  puts proj
  puts proj.gain_funds(1500)
  puts proj
end
