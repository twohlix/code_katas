# take a single argument and calculate its factorial

# recursive factorial
def factorial(num)
  return 1 if num == 1

  num * factorial(num-1)
end

to_factorial = ARGV[0].to_i 
answer = factorial to_factorial

puts "#{to_factorial}! = #{answer}"