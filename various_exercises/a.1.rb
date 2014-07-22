# take a single argument and calculate its factorial

class Integer
  def recursive_factorial
    return 1 if self == 1

    self * (self-1).factorial
  end

  def iterative_factorial
    answer = 1
    for i in 1..self
      answer *= i
    end

    answer
  end

  alias :factorial :iterative_factorial  #make 
end

to_factorial = ARGV[0].to_i 
answer = to_factorial.factorial

puts "#{to_factorial}! = #{answer}"