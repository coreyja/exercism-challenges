class Clock
  def self.at(hours, minutes)
    new hours, minutes
  end

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = (hours + (minutes / 60)) % 24
    @minutes = minutes % 60
  end

  def to_s
    "#{sprintf '%02d', hours}:#{sprintf '%02d', minutes}"
  end

  def +(minutes_to_add)
    self.class.new(hours, minutes+minutes_to_add)
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end
end

module BookKeeping
  VERSION = 2.freeze
end