module Pangram
  ALPHABET = ('a'..'z').freeze

  def self.is_pangram?(string)
    ALPHABET.all? { |x| string.downcase.include? x }
  end
end

module BookKeeping
  VERSION = 2
end