require_relative 'spec_helper'
require_relative 'pledge_type'

describe Pledge do

  before do
    @pledge = Pledge.new(:bronze, 50)
  end

  it 'has a color attribute' do
    @pledge.color.should == :bronze
  end

  it 'has an amount' do
    @pledge.amount.should == 50
  end
end

describe PledgeType do

  it 'has 3 types of pledges' do
    PledgeType::PLEDGES.size.should == 3
  end

  it 'has a bronze pledge worth 50 dollars' do
    PledgeType::PLEDGES[0].should == Pledge.new(:bronze, 50)
  end

  it 'has a silver pledge worth 75 dollars' do
    PledgeType::PLEDGES[1].should == Pledge.new(:silver, 75)
  end

  it 'has a gold pledge worth 100 dollars' do
    PledgeType::PLEDGES[2].should == Pledge.new(:gold, 100)
  end

  it 'returns a random pledge' do
    pledge = PledgeType.random

    PledgeType::PLEDGES.should include(pledge)
  end
end
