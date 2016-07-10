module RandomChars
  def self.random_letter
    ('A'..'Z').to_a[rand(26)]
  end

  def self.random_digit
    rand(10)
  end
end

class Robot
  @@used_names = {}

  def self.random_name
    "#{RandomChars.random_letter}#{RandomChars.random_letter}#{RandomChars.random_digit}#{RandomChars.random_digit}#{RandomChars.random_digit}"
  end

  def self.name_used?(name)
    @@used_names[name]
  end

  def initialize
    reset
  end

  def reset
    @name = Robot.random_name while name.nil? || Robot.name_used?(name)
    @@used_names[name] = true
  end

  attr_reader :name
end

module BookKeeping
  VERSION = 2
end