class Bob
  def hey(remark)
    Responder.new(remark).response
  end

  class Responder
    def initialize(remark)
      @remark = remark.strip
    end

    def response
      if nothing?
        'Fine. Be that way!'
      elsif yelling?
        'Whoa, chill out!'
      elsif question?
        'Sure.'
      else
        'Whatever.'
      end
    end

    private

    attr_reader :remark

    def question?
      remark.end_with?('?')
    end

    def yelling?
      contains_letter? && remark == remark.upcase
    end

    def contains_letter?
      /[a-zA-Z]/.match(remark)
    end

    def nothing?
      remark == ''
    end
  end
end