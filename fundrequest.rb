require_relative 'project'
require_relative 'die'

class FundRequest

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
      die = Die.new
      number_rolled = die.roll

      case number_rolled
      when 1..2
        project.lose_funds
      when 3..4
        "Project #{project.name} was skipped"
      else
        project.gain_funds
      end
      puts project
    end
  end
end
