module Gigasecond
  GIGASECOND = 10**9

  def self.from(time)
    time + GIGASECOND
  end
end

module BookKeeping
  VERSION = 3
end