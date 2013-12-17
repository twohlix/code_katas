require "awesome_print"
require_relative "anagram_list"

def usage_check args
  if args.length < 1
    puts "usage: #{$0} word-list [output-file]"
    exit 0
  end
end

def list_generator args
  words_file = File.new(args[0], "r")
  anagrams = AnagramList.new
  anagrams.add_words_from_file words_file
  words_file.close

  output_file = File.new(args[1], "w")
  anagram_sets_count = 0
  anagrams.all.each do |words|
    output_line = ''
    words.each do |word|
      output_line << ' ' if output_line.length > 0 
      output_line << word
    end
    output_file.puts output_line

    anagram_sets_count += 1
  end
  output_file.close
  
  ap "Done! #{anagrams.word_count} words used."
  ap "#{anagram_sets_count} sets of anagrams found."
end

def interactive_console args
  words_file = File.new(args[0], "r")
  anagrams = AnagramList.new
  anagrams.add_words_from_file words_file
  words_file.close
  
  ap "Added #{anagrams.word_count} words from #{args[0]}"

  ap "type exit to stop"
  user_input = ""
  while user_input.downcase != "exit"
    user_input = $stdin.gets.chomp
    user_input = user_input.strip
    words_anagrams = anagrams.anagrams_of user_input
    ap "#{user_input}: #{words_anagrams.join(' ')}"
  end
end

usage_check ARGV
if ARGV.length < 2
  interactive_console ARGV
else
  list_generator ARGV
end