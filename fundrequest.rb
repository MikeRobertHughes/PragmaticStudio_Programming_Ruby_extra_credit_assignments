require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

class FundRequest

  attr_reader :title

  def initialize(title)
    @title = title
    @projects = []
  end

  def load_projects(from_file)
    File.readlines(from_file).each do |line|
      name, total = line.split(",")
      add_project(Project.new(name, Integer(total)))
    end
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

    puts "\nTotal money invested from #{title} fund request:"
    puts "$#{total_investments} invested"

    @projects.each do |project|
      puts "\nProject #{project.name} totals:"
      project.each_pledge_received do |pledge|
        puts "#{pledge.color} pledges total $#{pledge.amount} "
      end
      puts "$#{project.total_funding} in total funding"
    end
  end

  def total_investments
    @projects.reduce(0) { |sum, project| sum + project.total_funding }
  end

  def print_stats
    puts "\n#{@title}'s Statistics:"

    @projects.sort.each do |project|
      puts "Project #{project.name} still needs $#{project.funding_needed}"
    end
  end
end
