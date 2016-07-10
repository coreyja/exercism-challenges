class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    if valid?
      calculate_decimal
    else
      0
    end
  end

  private

  attr_reader :trinary

  def calculate_decimal
    digits_with_powers.reduce(0) do |decimal, x|
      decimal + x.to_decimal
    end
  end

  def digits_with_powers
    digits.reverse.each_with_index.map do |digit, power|
      DigitWithPower.new digit, power
    end
  end

  def valid?
    all_digits? && digits.all? { |x| [0, 1, 2].include? x }
  end

  def digits
    trinary.chars.map(&:to_i)
  end

  def all_digits?
    trinary.chars.all? {|x| /\d/.match x }
  end

  DigitWithPower = Struct.new(:digit, :power) do
    def to_decimal
      (3**power * digit)
    end
  end
end

module BookKeeping
  VERSION = 1
end