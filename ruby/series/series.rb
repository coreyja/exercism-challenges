class Series
  def initialize(string)
    @string = string
  end

  def slices(slice_size)
    raise ArgumentError, 'Slice size can\'t be greater than series length' if slice_size > nums.length
    (0..count-slice_size).map do |i|
      slice_at_index i, slice_size
    end
  end

  private

  attr_reader :string

  def slice_at_index(i, slice_size)
    nums[i..i+slice_size-1]
  end

  def nums
    string.chars.map(&:to_i)
  end

  def count
    string.length
  end
end