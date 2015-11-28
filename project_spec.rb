require_relative 'spec_helper'
require_relative 'project'

describe 'Project' do

  it 'has an initial target funding amount' do
    project = Project.new("ABC", 500)
  end

  it 'computes the total funding outstanding as the target funding minus the funding amount'

  it 'increases funds by 25 when funds are added'

  it 'decreases funds by 15 when funds are removed'

  it 'has a default value of 0 for funding amount'
end
