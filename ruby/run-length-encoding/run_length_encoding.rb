module RunLengthEncoding
  def self.encode(string)
    Encoder.new(string).encode
  end

  def self.decode(string)
    Decoder.new(string).decode
  end

  class Encoder
    ENCODE_REGEX = /((.)\2*)/.freeze

    def initialize(string)
      @string = string
    end

    def encode
      matches.map(&:encode).reduce(:+)
    end

    private

    attr_reader :string

    def matches
      string.scan(ENCODE_REGEX).map { |m| Match.new *m }
    end

    Match = Struct.new(:string, :letter) do
      def encode
        "#{string.length if string.length > 1}#{letter}"
      end
    end
  end

  class Decoder
    DECODE_REGEX = /(\d*)?(.)/.freeze

    def initialize(string)
      @string = string
    end

    def decode
      matches.map(&:decode).reduce(:+)
    end

    private

    attr_reader :string

    def matches
      string.scan(DECODE_REGEX).map {|m| Match.new(*m) }
    end

    Match = Struct.new(:count, :letter) do
      def count_num
        if count.empty?
          1
        else
          count.to_i
        end
      end

      def decode
        letter * count_num
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end