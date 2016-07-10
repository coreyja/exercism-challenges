class Squares
  def initialize(n)
    @n = n
  end

  def square_of_sum
    sum**2
  end

  def sum_of_squares
    squares.reduce(0, :+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :n

  def nums
    (1..n).to_a
  end

  def sum
    nums.reduce(0, :+)
  end

  def squares
    nums.map { |x| x**2 }
  end
end

module BookKeeping
  VERSION = 3
end