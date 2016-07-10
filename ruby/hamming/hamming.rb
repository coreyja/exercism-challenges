module Hamming
  def self.compute(a,b)
    raise ArgumentError.new('Must be the same length') unless a.size == b.size
    a.chars.zip(b.chars).reject { |x| x.first == x.last }.count
  end
end
