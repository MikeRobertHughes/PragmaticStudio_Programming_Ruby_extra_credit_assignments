require_relative 'project'

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
      puts project
      puts "Project #{project.name} has a goal of $#{project.goal}."
      puts project.lose_funds(10)
      puts project.gain_funds(30)
      puts "Project #{project.name} still needs $#{project.funding_needed}."
    end
  end
end
