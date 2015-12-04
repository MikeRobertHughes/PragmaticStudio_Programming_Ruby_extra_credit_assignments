Pledge = Struct.new(:color, :amount)

module PledgeType
  PLEDGES = [
    Pledge.new(:bronze, 50),
    Pledge.new(:silver, 75),
    Pledge.new(:gold, 100)
  ]

  def self.random
    PLEDGES.sample
  end
end
