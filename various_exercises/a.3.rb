# roll the dice
# take 1 arguments: number of dice to roll
def usage
  puts "usage: #{$0} number_of_dice"
  exit
end
usage unless ARGV.length == 1

number_of_dice = ARGV[0].to_i

(1..number_of_dice).each do |die_num|
  result = 1 + rand(6)
  print "#{result} "
end

print "(Probability: #{(1.0/6.0)**number_of_dice})\n"
