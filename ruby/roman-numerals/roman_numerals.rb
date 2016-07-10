class RomanConvertor
  def initialize(number)
    @number = number
    @roman = ''
  end

  ARABIC_TO_ROMAN = [
      [1000, 'M'], [900, 'CM'],
      [500, 'D'], [400, 'CD'],
      [100, 'C'], [90, 'XC'],
      [50, 'L'], [40, 'XL'],
      [10, 'X'], [9, 'IX'],
      [5, 'V'],  [4, 'IV'],
      [1, 'I']
    ].freeze

  def roman
    ARABIC_TO_ROMAN.each do |num, roman|
      times = (@number/num).to_i
      @roman << roman * times
      @number -= num * times
    end
    @roman
  end
end

class Fixnum
  def to_roman
    RomanConvertor.new(self).roman
  end
end

module BookKeeping
  VERSION = 2
end