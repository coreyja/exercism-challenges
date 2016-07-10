module FoodChain
  def self.song
    Song.new.song
  end

  class Song
    DEFAULT_ANIMAL_ORDER = [:fly, :spider, :bird, :cat, :dog, :goat, :cow, :horse]

    def initialize(animal_order=DEFAULT_ANIMAL_ORDER)
      @animal_order = animal_order
    end

    def song
      verses.map(&:sing).reduce(:+)
    end

    private

    attr_reader :animal_order

    def verses
      [].tap do |verses|
        animal_order.each_with_index do |animal, i|
          if animal == animal_order.last
            verses << LastVerse.new(animal)
          else
            verses << Verse.new(animal, verses[i-1])
          end
        end
      end
    end
  end

  class Verse
    CUSTOM_ENDING_LINE = {
        fly: "I don't know why she swallowed the fly. Perhaps she'll die.",
        bird: 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.',
    }

    SECOND_LINE = {
        spider: 'It wriggled and jiggled and tickled inside her.',
        bird: 'How absurd to swallow a bird!',
        cat: 'Imagine that, to swallow a cat!',
        dog: 'What a hog, to swallow a dog!',
        goat: 'Just opened her throat and swallowed a goat!',
        cow: "I don't know how she swallowed a cow!",
        horse: "She's dead, of course!"
    }

    attr_reader :animal

    def initialize(animal, previous_verse = nil)
      @animal = animal.to_sym
      @previous_verse= previous_verse
    end


    def sing(with_opening = true)
      ''.tap do |verse|
        verse << "#{opening}\n" if with_opening
        verse << "#{ending_line}\n"
        verse << previous_verse.sing(false) if previous_verse?
        verse << "\n" if with_opening
      end
    end

    private

    attr_reader :previous_verse

    def ending_line
      if custom_ending_line?
        custom_ending_line
      else
        default_ending_line
      end
    end

    def opening
      if second_line?
        "#{starting_line}\n#{second_line}"
      else
        starting_line
      end
    end

    def previous_verse?
      !previous_verse.nil?
    end

    def previous_animal
      previous_verse.animal
    end

    def starting_line
      "I know an old lady who swallowed a #{animal}."
    end

    def default_ending_line
      "She swallowed the #{animal} to catch the #{previous_animal}."
    end

    def second_line
      SECOND_LINE[animal]
    end

    def second_line?
      SECOND_LINE.key? animal
    end

    def custom_ending_line
      CUSTOM_ENDING_LINE[animal]
    end

    def custom_ending_line?
      CUSTOM_ENDING_LINE.key? animal
    end
  end

  class LastVerse < Verse
    def sing
      "#{opening}\n"
    end
  end
end

module BookKeeping
  VERSION = 2
end