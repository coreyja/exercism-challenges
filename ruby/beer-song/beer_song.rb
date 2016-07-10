class BeerSong
  module BeerSongUtils
    refine String do
      def pluralize_with_count(count)
        if count == 0
          "no more #{self}s"
        elsif count == 1
          "#{count} #{self}"
        else
          "#{count} #{self}s"
        end
      end

      def capitalize_first_char
        self.chars.tap do |chars|
          chars.first.upcase!
        end.join
      end
    end
  end

  using BeerSongUtils

  def verse(num)
    Verse.new(num).verse
  end

  def verses(start_at, end_at)
    (end_at..start_at).to_a.reverse.map {|n| verse(n) }.join("\n")
  end

  def lyrics
    verses 99, 0
  end

  private

  class Verse
    def initialize(num)
      raise ArgumentError, "Invalid Verse" unless (0..99).include? num
      @num = num
    end

    def verse
      first_sentence + second_sentence
    end

    private

    attr_reader :num

    def first_sentence
      "#{'bottle'.pluralize_with_count(num).capitalize_first_char} of beer on the wall, #{'bottle'.pluralize_with_count(num)} of beer.\n"
    end

    def second_sentence
      if num == 0
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "Take #{object_noun} down and pass it around, #{'bottle'.pluralize_with_count(num-1)} of beer on the wall.\n"
      end
    end

    def object_noun
      if num == 1
        'it'
      else
        'one'
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end