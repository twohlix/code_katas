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

  words_list = Array.new

  while (line = words_file.gets)
    word_candidate = line.strip
    word_candidate.downcase!
    words_list << word_candidate unless word_candidate.index("'") # get rid of possesives
  end
  
  words_file.close

  anagrams = Hash.new
  words_list.each do |word|
    hash_key = word.strip.downcase.chars.sort.join
    anagrams[hash_key] = Array.new unless anagrams.has_key? hash_key
    anagrams[hash_key] << word
  end

  output_file = File.new(args[1], "w")
  anagrams.each_value do |words|
    output_line = ''
    words.each do |word|
      output_line << ' ' if output_line.length > 0 
      output_line << word
    end
    output_file.puts output_line
  end

  output_file.close
  ap "Done! #{words_list.length} words used."
end

high_memory_version ARGV