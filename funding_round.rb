require_relative 'project'
require_relative 'die'
require_relative 'pledge_type'

module FundingRound

  def self.fund_projects(project)
    die = Die.new
    number_rolled = die.roll
    pledge = PledgeType.random

    case number_rolled
    when 1..2
      puts project.lose_funds
    when 3..4
      "Project #{project.name} was skipped"
    else
      puts project.gain_funds
    end

    project.pledge_received(pledge)
  end
end
