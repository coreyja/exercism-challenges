module Complement
  def self.of_dna(dna)
    DnaToRna.new(dna).convert
  end

  class DnaToRna
    CONVERSION = {
        'C' => 'G',
        'G' => 'C',
        'T' => 'A',
        'A' => 'U'
    }

    def initialize(dna)
      @dna = dna
    end

    def convert
      if valid?
        rna
      else
        ''
      end
    end

    private

    attr_reader :dna

    def chars
      dna.chars
    end

    def rna
      @_rna ||= chars.map {|l| CONVERSION[l] }.join
    end

    def valid?
      rna.length == dna.length
    end
  end
end

module BookKeeping
  VERSION = 4
end