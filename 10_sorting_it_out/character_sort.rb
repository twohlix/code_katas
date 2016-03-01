require 'pry'
require 'awesome_print'

def conspiracy_text_sort(text_to_sort)
  text_to_sort.downcase!
  text_to_sort.gsub!(/^[a-z]/i, '')

  results = {}
  text_to_sort.each_char {|pseudo_character|
    !results[pseudo_character].nil? ? results[pseudo_character] += 1 : results[pseudo_character] = 1
  }

  binding.pry
end

conspiracy_text_sort('a whole fat can')