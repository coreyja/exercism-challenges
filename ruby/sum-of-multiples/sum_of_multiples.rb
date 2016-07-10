module FixnumMultiples
  refine Fixnum do
    def multiple_of_any?(nums)
      nums.any? {|num| self.multiple_of? num }
    end

    def multiple_of?(num)
      self % num == 0
    end
  end
end

class SumOfMultiples
  using FixnumMultiples

  def initialize(*multiples_of)
    @multiples_of = multiples_of
  end

  def to(limit)
    multiples_up_to(limit).reduce(0, :+)
  end

  private

  attr_reader :multiples_of

  def multiples_up_to(limit)
    (1..limit-1).select {|x| x.multiple_of_any? multiples_of }
  end
end