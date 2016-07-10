class Array
  def keep(&test_proc)
    self.map do |i|
      i if test_proc.call(i)
    end.compact
  end

  def discard(&test_proc)
    self.map do |i|
      i unless test_proc.call(i)
    end.compact
  end
end

