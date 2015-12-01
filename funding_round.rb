require_relative 'project'
require_relative 'die'

module FundingRound

  def self.fund_projects(project)
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
  end
end
