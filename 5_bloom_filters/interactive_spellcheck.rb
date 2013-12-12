require "awesome_print"
require_relative "spell_checker"

def usage_check args
  if args.length < 1
    puts "usage: #{$0} filename"
    exit 0
  end
end


usage_check ARGV

ap "Starting up interactive spell checker with wordlist: #{ARGV[0]}"
sc = SpellChecker.new
sc.add_correct_words_from_file ARGV[0]

ap "SpellChecker up and running with #{sc.word_count} words loaded."
ap "type exit to stop"
ap "It will only tell you when you mispell a word. Try it out:"
user_input = "nerp"
while user_input.downcase != "exit"
  user_input = $stdin.gets.chomp
  user_input = user_input.strip
  if sc.spelled_correctly? user_input
    ap "#{user_input} == SUCCESS!"
  else
    ap "#{user_input} was spelled incorrectly or is not in the word list"
  end
end