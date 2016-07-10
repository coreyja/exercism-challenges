class Array
  def accumulate(&proc)
    self.each_with_object([]) do |item,memo|
      memo << proc.call(item)
    end
  end
end