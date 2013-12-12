# third implementation
# cheating to compare performance
def third_chop needle, haystack
  ind = haystack.index needle

  return ind if ind
  -1
end

# second implementation
# recursive
def second_chop needle, haystack, index_offset=0
  return -1 if haystack.nil? # needed for certain slice returns
  return -1 if haystack.count == 0

  pivot_point = haystack.count / 2.0
  pivot_point = pivot_point.floor
  pivot_value = haystack[pivot_point]

  # base case
  return pivot_point+index_offset if pivot_value == needle

  # upper half
  if needle > pivot_value 
    return second_chop needle, haystack.slice(pivot_point+1, pivot_point), index_offset+pivot_point+1
  end

  # lower half
  second_chop needle, haystack.slice(0, pivot_point), index_offset
end

# first implementation
def first_chop needle, haystack
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
  def wrap to_test=method(:chop)
    puts "Testing method: #{to_test.name.to_s}"

    assert_equal(-1, to_test.call(3, []))
    assert_equal(-1, to_test.call(3, [1]))
    assert_equal(0,  to_test.call(1, [1]))
    #
    assert_equal(0,  to_test.call(1, [1, 3, 5]))
    assert_equal(1,  to_test.call(3, [1, 3, 5]))
    assert_equal(2,  to_test.call(5, [1, 3, 5]))
    assert_equal(-1, to_test.call(0, [1, 3, 5]))
    assert_equal(-1, to_test.call(2, [1, 3, 5]))
    assert_equal(-1, to_test.call(4, [1, 3, 5]))
    assert_equal(-1, to_test.call(6, [1, 3, 5]))
    #
    assert_equal(0,  to_test.call(1, [1, 3, 5, 7]))
    assert_equal(1,  to_test.call(3, [1, 3, 5, 7]))
    assert_equal(2,  to_test.call(5, [1, 3, 5, 7]))
    assert_equal(3,  to_test.call(7, [1, 3, 5, 7]))
    assert_equal(-1, to_test.call(0, [1, 3, 5, 7]))
    assert_equal(-1, to_test.call(2, [1, 3, 5, 7]))
    assert_equal(-1, to_test.call(4, [1, 3, 5, 7]))
    assert_equal(-1, to_test.call(6, [1, 3, 5, 7]))
    assert_equal(-1, to_test.call(8, [1, 3, 5, 7]))

    test_chop_speed to_test #only do this if we pass our tests!
  end

  def test_chops
    wrap method(:first_chop)
    wrap method(:second_chop)
    wrap method(:third_chop)
  end
end

require 'benchmark'
def test_chop_speed to_time=method(:chop)
  puts "Timing method:#{to_time.name.to_s}"

  n = 50000
  Benchmark.bm(20) do |x|
    x.report("empty:") {n.times do; to_time.call(3, []);  end }
    x.report("not present length 1:") {n.times do; to_time.call(3, [1]); end }
    x.report("first length 3:") {n.times do; to_time.call(1, [1, 3, 5]); end }
    x.report("last length 3:") {n.times do; to_time.call(5, [1, 3, 5]); end }
    x.report("not present length 3:") {n.times do; to_time.call(0, [1, 3, 5]); end }
    x.report("first length 5:") {n.times do; to_time.call(1, [1, 3, 6, 9, 11]); end }
    x.report("last length 5:") {n.times do; to_time.call(11, [1, 3, 6, 9, 11]); end }
    x.report("not present length 5:") {n.times do; to_time.call(4, [1, 3, 6, 9, 11]); end }
  end
end