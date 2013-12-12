require_relative 'bloom_filter'

class SpellChecker
  def initialize expected_word_count=16000
    @filter = BloomFilter.new(expected_word_count*4, 5)
    @word_count = 0
  end

  def word_count
    @word_count
  end

  def add_correct_word word
    if @filter.add_object word
      @word_count += 1
    end
  end

  def spelled_correctly? word
    @filter.contains_object? word
  end

  def add_correct_words_from_file filename
    word_file = File.new(filename, "r")
    while (line = word_file.gets)
      add_correct_word line.strip
    end
    word_file.close

    word_count
  end

  def debug
    @filter.debug_bitarray
  end
end