class AnagramList
  require 'enumerator'

  def initialize word_list=nil
    @anagrams = Hash.new

    add_words word_list
  end

  def add_word word
    the_key = hash_key word

    @anagrams[the_key] = Array.new unless @anagrams.has_key? the_key
    @anagrams[the_key] << word unless @anagrams[the_key].include? word
  end

  def add_words word_list
    return false unless word_list
    return false unless word_list.length > 0

    word_list.each do |word|
      add_word word
    end

    true
  end

  # gets the anagrams of the given word, excluding itself (case-sensitive)
  def anagrams_of word
    the_key = hash_key word

    return [] unless @anagrams.has_key? the_key
    @anagrams[the_key] - [word]
  end

  # returns an array of arrays of all the anagram sets (not single words)
  def all
    to_return = Array.new

    @anagrams.each_value do |words|
      to_return << words unless words.length < 2
    end

    to_return
  end

  private
  def hash_key word
    sterilize_word(word).chars.sort.join
  end

  def sterilize_word word
    word.downcase.strip.delete("^a-z")
  end
end