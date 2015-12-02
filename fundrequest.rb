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

  def report(rounds)
    puts "There are #{@projects.size} in the group \"#{title}\" that need to be crowdfunded."
    puts @projects

    1.upto(rounds) do |round|
      puts "\nRound #{round}"
      @projects.each do |project|
        FundingRound.fund_projects(project)
        puts project
      end
    end

    def print_stats
      puts "\n#{@title}'s Statistics:"

      @projects.sort.each do |project|
        puts "Project #{project.name} still needs #{project.funding_needed}"
      end
    end
  end
end
