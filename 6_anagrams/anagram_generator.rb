require "awesome_print"

def usage_check args
  if args.length < 2
    puts "usage: #{$0} input-file output-file"
    exit 0
  end
end

def high_memory_version args
  usage_check args
  words_file = File.new(args[0], "r")
  anagrams = Hash.new

  word_count = 0
  while (line = words_file.gets)
    word = line.strip
    word.downcase!
    next if word.index("'") # get rid of possesives
    
    hash_key = word.chars.sort.join
    anagrams[hash_key] = Array.new unless anagrams.has_key? hash_key
    anagrams[hash_key] << word

    word_count += 1
  end
  words_file.close

  output_file = File.new(args[1], "w")
  anagram_sets_count = 0
  anagrams.each_value do |words|
    next if words.length < 2

    output_line = ''
    words.each do |word|
      output_line << ' ' if output_line.length > 0 
      output_line << word
    end
    output_file.puts output_line

    anagram_sets_count += 1
  end
  output_file.close
  
  ap "Done! #{word_count} words used."
  ap "#{anagram_sets_count} sets of anagrams found."
end

high_memory_version ARGV