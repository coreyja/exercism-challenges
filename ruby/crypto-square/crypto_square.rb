require 'matrix'

class Crypto
  module Utils
    refine Fixnum do
      def sqrt
        self ** (1.0/2)
      end
    end

    refine String do
      def segment(n)
        [].tap do |segments|
          i = 0
          while self[i]
            segments << self[i..i+n-1]
            i += n
          end
        end
      end
    end
  end
  using Utils

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.gsub(/[[:punct:]$^ ]/,'').downcase
  end

  def size
    normalize_plaintext.length.sqrt.ceil
  end

  def plaintext_segments
    normalize_plaintext.segment(size)
  end

  def ciphertext
    cipher_matrix.to_a.join
  end

  def normalize_ciphertext
    cipher_matrix.to_a.map(&:join).join ' '
  end

  private

  attr_reader :message

  def plaintext_matrix
    Matrix[*plaintext_padded_segment_chars]
  end

  def plaintext_padded_segment_chars
    plaintext_segments.map(&:chars).map do |segment|
      segment.tap do |segment|
        segment << '' until segment.length == size
      end
    end
  end

  def cipher_matrix
    plaintext_matrix.transpose
  end
end