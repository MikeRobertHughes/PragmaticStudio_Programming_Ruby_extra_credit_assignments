require_relative 'spec_helper'
require_relative 'project'
require_relative 'pledge_type'

describe 'Project' do

  before do
    $stdout = StringIO.new
    @initial_funds = 500
    @project = Project.new("ABC", 500, 1000)
  end

  it 'has a string representation' do
    @project.pledge_received(Pledge.new(:bronze, 50))
    @project.pledge_received(Pledge.new(:bronze, 50))

    @project.to_s.should == "Project ABC needs $400 in funding, has a goal of $1000 and has received $100 in pledges."
  end

  it 'has an initial target funding amount' do
    @project.goal.should == 1000
  end

  it 'computes the total funding outstanding as the target funding minus the initial funding amount plus total pledges' do
    @project.pledge_received(Pledge.new(:bronze, 50))
    @project.pledge_received(Pledge.new(:bronze, 50))

    @project.funding_needed.should == (1000 - 600)
  end

  it 'increases funds by 25 when funds are added' do
    @project.gain_funds

    @project.total.should == (@initial_funds + 25)
  end

  it 'decreases funds by 15 when funds are removed' do
    @project.lose_funds

    @project.total.should == (@initial_funds - 15)
  end

  it 'computes funding as sum of all pledge dollar amounts' do
    @project.funding.should == 0

    @project.pledge_received(Pledge.new(:bronze, 50))

    @project.funding.should == 50

    @project.pledge_received(Pledge.new(:silver, 75))

    @project.funding.should == 125

    @project.pledge_received(Pledge.new(:gold, 100))

    @project.funding.should == 225
  end

  it 'yields pledge and its total points' do
    @project.pledge_received(Pledge.new(:bronze, 50))
    @project.pledge_received(Pledge.new(:bronze, 50))
    @project.pledge_received(Pledge.new(:silver, 75))
    @project.pledge_received(Pledge.new(:gold, 100))
    @project.pledge_received(Pledge.new(:gold, 100))
    @project.pledge_received(Pledge.new(:gold, 100))

    yielded = []

    @project.each_pledge_received do |pledge|
      yielded << pledge
    end

    yielded.should == [
      Pledge.new(:bronze, 100),
      Pledge.new(:silver, 75),
      Pledge.new(:gold, 300),
    ]
  end

  it 'parses a CSV file' do
    line = "NGO,400"
    project = Project.from_csv(line)

    project.name.should == "NGO"
    project.total.should == 400
  end

  context 'has a default value of 0 for funding amount' do
    before do
      @project = Project.new("ABC")
    end

    it 'has a default funding of 0' do
      @project.total == 0
    end
  end

  context 'in a collection of projects' do
    before do
      @project1 = Project.new("ABC", 900)
      @project2 = Project.new("DEF", 700)
      @project3 = Project.new("GHI", 500)

      @projects = [@project1, @project2, @project3]
    end

    it 'is sorted by decreasing funding needed' do
      @projects.sort.should == [@project3, @project2, @project1]
    end
  end
end
