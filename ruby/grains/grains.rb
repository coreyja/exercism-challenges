class Grains
  @@squares = { 1 => 1 }

  def self.square(n)
    raise ArgumentError unless (1..64).include? n
    @@squares[n] ||= Grains.square(n-1) * 2
  end

  def self.total
    (1..64).map {|x| Grains.square x }.reduce(:+)
  end
end