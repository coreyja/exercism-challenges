require 'prime'

module PrimeFactors
  def self.for(num)
    PrimeFactorer.new(num).prime_factors
  end

  class PrimeFactorer
    def initialize(num)
      @num = num
      @prime_factors = []
      @i = 2
    end

    def prime_factors
      calculate_next_factor until all_factors_calculated?
      @prime_factors
    end

    private

    attr_reader :num, :i

    def all_factors_calculated?
      num == 1
    end

    def calculate_next_factor
      if num % i == 0
        @prime_factors << i
        @num /= i
      else
        @i += 1
      end
    end
  end
end