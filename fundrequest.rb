require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

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
      FundingRound.fund_projects(project)
      puts project
    end
  end
end
