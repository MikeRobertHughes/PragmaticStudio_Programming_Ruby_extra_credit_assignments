require_relative 'spec_helper'
require_relative 'fundrequest'

describe FundRequest do
  before do
    @fundrequest = FundRequest.new('Nonprofits')

    @initial_funds = 500
    @project = Project.new("ABC", @initial_funds)

    @fundrequest.add_project(@project)
  end

  it 'gains funding if a high number is rolled' do
    Die.any_instance.stub(:roll).and_return(5)

    @fundrequest.report

    @project.total.should == @initial_funds + 25
  end

  it 'is skipped if a medium number is rolled' do
    Die.any_instance.stub(:roll).and_return(3)

    @fundrequest.report

    @project.total.should == @initial_funds
  end

  it 'loses funding if a low number is rolled' do
    Die.any_instance.stub(:roll).and_return(1)

    @fundrequest.report

    @project.total.should == @initial_funds - 15
  end
end
