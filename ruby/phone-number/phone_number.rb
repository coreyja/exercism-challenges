class PhoneNumber
  INVALID_NUMBER = '0000000000'

  def initialize(string)
    @string = string
  end

  def area_code
    number[0..2]
  end

  def number
    if valid?
      numbers
    else
      INVALID_NUMBER
    end
  end

  def to_s
    "(#{area_code}) #{first_three}-#{last_four}"
  end

  private

  attr_reader :string

  def first_three
    number[3..5]
  end

  def last_four
    number[6..10]
  end

  def numbers
    if ten_digit?
      stripped_string
    else
      stripped_string[1,11]
    end
  end

  def valid?
    all_digits? && correct_length?
  end

  def correct_length?
    ten_digit? || (eleven_digit? && starts_with_1?)
  end

  def starts_with_1?
    stripped_string.chars.first == '1'
  end

  def eleven_digit?
    stripped_string.length == 11
  end

  def all_digits?
    stripped_string.chars.all? {|x| /\d/.match x }
  end

  def ten_digit?
    stripped_string.length == 10
  end

  def stripped_string
    string.gsub(/[()\- .]/,'')
  end
end