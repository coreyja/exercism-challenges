class Game
  module ArrayUtils
    refine Array do
      def sum
        self.reduce 0, &:+
      end
    end
  end
  using ArrayUtils

  attr_reader :frames

  def initialize
    @frames = [Frame.new(0)]
  end

  def roll(pins)
    raise RuntimeError, 'Pins must have a value from 0 to 10' unless (0..10).include? pins
    raise RuntimeError, 'Should not be able to roll after game is over' if over?
    current_frame.roll(pins)
  end

  def score
    raise RuntimeError, 'Score cannot be taken until the end of the game' unless over?
    frames.map do |frame|
      i = frame.i
      if frame.fill_frame?
        0
      elsif frame.strike?
        (rolls_for_strike_from(i) + frame.rolls).sum
      elsif frame.spare?
        [frame.pins, roll_for_spare_from(i)].sum
      else
        frame.pins
      end
    end.sum
  end

  private

  def current_frame
    if last_frame.over?
      @frames << Frame.new(frames.count)
    end
    last_frame
  end

  def over?
    no_more_frames? && (last_frame.over? || last_frame.fill_frame?)
  end

  def no_more_frames?
    if frames.count == 10
      !(tenth_frame.pins == 10)
    elsif frames.count == 11
      (tenth_frame.spare? && one_fill_roll?) || (tenth_frame.strike? && two_fill_rolls?)
    elsif frames.count == 12
      tenth_frame.strike?
    else
      false
    end
  end

  def last_frame
    frames.last
  end

  def tenth_frame
    frames[9]
  end

  def fill_frames
    frames[10..11]
  end

  def fill_rolls
    fill_frames.map(&:rolls).flatten
  end

  def one_fill_roll?
    fill_rolls.count == 1
  end

  def two_fill_rolls?
    fill_rolls.count == 2
  end

  def rolls_for_frames(range)
    frames[range].map(&:rolls).flatten
  end

  def rolls_for_strike_from(i)
    rolls_for_frames(i+1..i+2)[0..1]
  end

  def roll_for_spare_from(i)
    rolls_for_frames(i+1..i+1)[0]
  end


  class Frame
    attr_reader :rolls, :i

    def initialize(i)
      @rolls = []
      @i = i
    end

    def roll(pins)
      @rolls << pins
      raise RuntimeError, 'Pin count exceeds pins on the lane' if self.pins > 10
    end

    def over?
      rolls.length >= 2 || pins == 10
    end

    def strike?
      single_roll? && pins == 10
    end

    def spare?
      !single_roll? && pins == 10
    end

    def pins
      rolls.sum
    end

    def fill_frame?
      i >= 10
    end

    def first_roll
      rolls[0]
    end

    def second_roll
      rolls[1]
    end

    private

    def single_roll?
      rolls.length == 1
    end
  end
end

module BookKeeping
  VERSION = 1
end