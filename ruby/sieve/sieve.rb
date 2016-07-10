class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @_primes ||= [].tap do |primes|
      list = (2..limit).to_a
      until list.empty? do
        prime = list.first
        primes << prime
        list.reject! { |x| x % prime == 0 }
      end
    end
  end

  private

  attr_reader :limit
end