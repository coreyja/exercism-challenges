class Prime
  @@primes = [2]

  def self.nth(n)
    raise ArgumentError if n < 1
    x = @@primes.last
    until (@@primes.count - 1) >= n
      @@primes << x if @@primes.none? { |i| x % i == 0 }
      x += 1
    end
    @@primes[n-1]
  end
end