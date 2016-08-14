class Alphametics
  def solve(string)
    Puzzle.new(string).solve
  end

  class Puzzle
    def initialize(string)
      @parts = string.split.map do |part|
        if /[+*-=^][=]?/.match part
          part.sub('^','**')
        else
          Word.new part
        end
      end
    end

    def solve
      solutions.first&.letter_hash
    end

    private

    def solutions
      @solution ||= possibilities.select(&:solution?)
    end

    def possibilities
      @possibilities ||= PossibilityGenerator.new(keys).possibilities.map do |p|
        PossibleAnswer.new p, parts
      end
    end

    def words
      parts.select { |x| x.is_a? Word }
    end

    def keys
      words.map(&:word).join.chars.uniq
    end

    attr_reader :parts

    class PossibilityGenerator
      def initialize(keys)
        @keys = keys
      end

      def possibilities
        possibilities_for_keys keys
      end

      private

      attr_reader :keys

      def possibilities_for_keys(keys, hash={})
        return hash if keys.empty?
        (0..9).map do |i|
          possibilities_for_keys keys[1,keys.count], hash.merge(keys.first =>  i)
        end.flatten
      end
    end

    class PossibleAnswer
      attr_reader :letter_hash, :parts

      def initialize(letter_hash, parts)
        @letter_hash = letter_hash
        @parts = parts
      end

      def solution?
        valid? && eval(equation)
      end

      private

      def valid?
        valid_words? && unique_letters?
      end

      def equation
        parts.map do |part|
          if part.is_a? Word
            part.translate letter_hash
          else
            part
          end
        end.join(' ')
      end

      def words
        parts.select { |x| x.is_a? Word }
      end

      def valid_words?
        words.all? { |w| w.valid? letter_hash }
      end

      def unique_letters?
        letter_hash.values.uniq.count == letter_hash.values.count
      end
    end

    class Word
      attr_reader :word

      def initialize(word)
        @word = word
      end

      def translate(letter_hash)
        word.chars.map do |letter|
          letter_hash[letter]
        end.join
      end

      def valid?(letter_hash)
        word.length <= 1 || starts_with_zero?(letter_hash)
      end

      def starts_with_zero?(letter_hash)
        letter_hash[word[0]] != 0
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end