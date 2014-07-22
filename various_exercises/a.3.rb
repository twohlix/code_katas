# roll the dice
# take 1 or 2 arguments: number of dice to roll, [sides per die]
def usage
  puts "usage: #{$0} number_of_dice [sides_per_die]"
  exit
end
usage unless ARGV.length >= 1

number_of_dice = ARGV[0].to_i
sides_per_die = 6 #default sides per die
sides_per_die = ARGV[1].to_i unless ARGV.length < 2

(1..number_of_dice).each do |die_num|
  result = 1 + rand(sides_per_die)
  print "#{result} "
end

print "(Probability: #{(1.0/sides_per_die.to_f)**number_of_dice})\n"
