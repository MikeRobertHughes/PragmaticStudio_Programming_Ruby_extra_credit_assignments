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
