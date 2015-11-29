require_relative 'spec_helper'
require_relative 'project'

describe 'Project' do

  before do
    @initial_funds = 500
    @project = Project.new("ABC", 500, 1000)
  end

  it 'has an initial target funding amount' do
    @project.goal.should == 1000
  end

  it 'computes the total funding outstanding as the target funding minus the funding amount' do
    @project.funding_needed.should == (1000 - 500)
  end

  it 'increases funds by 25 when funds are added' do
    @project.gain_funds

    @project.total.should == (@initial_funds + 25)
  end

  it 'decreases funds by 15 when funds are removed' do
    @project.lose_funds

    @project.total.should == (@initial_funds - 15)
  end

  context 'has a default value of 0 for funding amount' do
    before do
      @project = Project.new("ABC")
    end

    it 'has a default funding of 0' do
      @project.total == 0
    end
  end
end
