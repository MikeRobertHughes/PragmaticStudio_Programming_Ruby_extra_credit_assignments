require_relative 'spec_helper'
require_relative 'fundrequest'
require_relative 'pledge_type'

describe FundRequest do
  before do
    $stdout = StringIO.new
    @fundrequest = FundRequest.new('Nonprofits')

    @initial_funds = 500
    @project = Project.new("ABC", @initial_funds)

    @fundrequest.add_project(@project)
  end

  it 'gains funding if a high number is rolled' do
    Die.any_instance.stub(:roll).and_return(5)

    @fundrequest.report(2)

    @project.total.should == @initial_funds + (25 * 2)
  end

  it 'is skipped if a medium number is rolled' do
    Die.any_instance.stub(:roll).and_return(3)

    @fundrequest.report(2)

    @project.total.should == @initial_funds
  end

  it 'loses funding if a low number is rolled' do
    Die.any_instance.stub(:roll).and_return(1)

    @fundrequest.report(2)

    @project.total.should == @initial_funds - (15 * 2)
  end

  it 'assigns a pledge for dollar amounts during funding round' do
    fundrequest = FundRequest.new("Nonprofits")
    project = Project.new("ABC")

    fundrequest.add_project(project)

    fundrequest.report(1)

    project.funding.should_not be_zero
  end

  it 'computes total investments as the sum of all projects totals' do
    fundrequest = FundRequest.new("Nonprofits")

    project1 = Project.new("ABC", 300)
    project2 = Project.new("DEF", 500)

    fundrequest.add_project(project1)
    fundrequest.add_project(project2)

    project1.pledge_received(Pledge.new(:bronze, 50))
    project1.pledge_received(Pledge.new(:bronze, 50))
    project2.pledge_received(Pledge.new(:bronze, 50))

    fundrequest.total_investments.should == 950
  end
end
