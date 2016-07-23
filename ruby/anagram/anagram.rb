class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_matches)
    possible_matches.select do |possible_match|
      PossibleMatch.new(word, possible_match).anagram?
    end
  end

  private

  attr_reader :word

  class PossibleMatch
    module StringToHash
      refine String do
        def letter_count
          Hash.new(0).tap do |letter_hash|
            self.chars.each do |letter|
              letter_hash[letter] += 1
            end
          end
        end
      end
    end
    using StringToHash

    attr_reader :word, :possible_match

    def initialize(word, possible_match)
      @word = word.downcase
      @possible_match = possible_match.downcase
    end

    def anagram?
      different_word? && same_letter_count?
    end

    private

    def different_word?
      word != possible_match
    end

    def same_letter_count?
      word.letter_count == possible_match.letter_count
    end
  end
end