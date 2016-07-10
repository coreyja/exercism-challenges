class Binary
  def initialize(binary)
    raise ArgumentError, 'Not valid binary' unless binary.chars.all? {|c| '10'.include? c }
    @binary = binary
  end

  def to_decimal
    digits_in_power_order.each_with_index.map { |binary, power| 2**power*binary }.reduce(:+)
  end

  private

  attr_reader :binary

  def digits_in_power_order
    binary.chars.reverse.map(&:to_i)
  end
end

module BookKeeping
  VERSION = 2
end