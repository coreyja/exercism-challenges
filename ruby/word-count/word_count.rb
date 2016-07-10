class Phrase
  WORD_REGEX = /[\w\d]+(?:'\w)?/.freeze

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    Hash.new(0).tap do |hash|
      downcased_words.each do |word|
        hash[word] += 1
      end
    end
  end

  private

  attr_reader :phrase

  def downcased_words
    words.map(&:downcase)
  end

  def words
    phrase.gsub(/[,]/,' ').split.map {|x| WORD_REGEX.match(x).to_a }.flatten
  end
end

module BookKeeping
  VERSION = 1
end