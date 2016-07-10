module ETL
  def self.transform(old)
   Transformer.new(old).transform
  end

  class Transformer
    def initialize(old)
      @old = old
      @transformed = {}
    end

    def transform
      old.each do |key, values|
        values.map(&:downcase).each do |x|
          transformed[x] = key
        end
      end
      transformed
    end

    private

    attr_reader :old, :transformed
  end
end