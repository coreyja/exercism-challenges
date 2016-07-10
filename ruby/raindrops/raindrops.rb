require 'prime'

module Raindrops
  def self.convert(number)
    RaindropsConvertor.new(number).convert
  end

  class RaindropsConvertor
    def initialize(number)
      @number = number
    end

    def convert
      if valid?
        words.join
      else
        number.to_s
      end
    end

    private

    attr_reader :number

    def primes
      Prime.prime_division(number).map(&:first)
    end

    def words
      @_words ||= [].tap do |words|
        words << 'Pling' if three?
        words << 'Plang' if five?
        words << 'Plong' if seven?
      end
    end

    def three?
      primes.include? 3
    end

    def five?
      primes.include? 5
    end

    def seven?
      primes.include? 7
    end

    def valid?
      !words.empty?
    end
  end
end

module BookKeeping
  VERSION = 2
end