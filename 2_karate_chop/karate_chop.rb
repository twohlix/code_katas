
# first implementation
def chop needle, haystack
  return -1 if haystack.nil? # unnecessary according to spec
  return -1 if !haystack.kind_of? Array # unnecessary according to spec
  return -1 if haystack.count == 0

  index_offset = 0
  while haystack.count > 0
    pivot_point = haystack.count / 2.0
    pivot_point = pivot_point.floor 
    pivot_value = haystack[pivot_point]

    if pivot_value == needle
      # found it
      return index_offset + pivot_point
    elsif pivot_value > needle
      # value is possibly in lower half
      haystack.slice!(pivot_point)
    else
      # value is possibly in upper half
      haystack.slice!(0..(pivot_point-1))
      index_offset += pivot_point
    end
  end

  -1 #failure value
end

# Testing provided by codekata.pragprog.com/2007/01/kata_two_karate.html
require 'test/unit'
class TestChop < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))

    test_chop_speed #only do this if we pass our tests!
  end
end

require 'benchmark'
def test_chop_speed
  puts "Timing Chop"

  n = 50000
  Benchmark.bm(20) do |x|
    x.report("empty:") {n.times do; chop(3, []);  end }
    x.report("not present length 1:") {n.times do; chop(3, [1]); end }
    x.report("first length 3:") {n.times do; chop(1, [1, 3, 5]); end }
    x.report("last length 3:") {n.times do; chop(5, [1, 3, 5]); end }
    x.report("not present length 3:") {n.times do; chop(0, [1, 3, 5]); end }
    x.report("first length 5:") {n.times do; chop(1, [1, 3, 6, 9, 11]); end }
    x.report("last length 5:") {n.times do; chop(11, [1, 3, 6, 9, 11]); end }
    x.report("not present length 5:") {n.times do; chop(4, [1, 3, 6, 9, 11]); end }
  end
end