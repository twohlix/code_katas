# Testing
require 'test/unit'
require 'awesome_print'
require_relative 'bloom_filter'
class TestBloomFilter < Test::Unit::TestCase
  def hashes m_size
    bf = BloomFilter.new(m_size)

    ap "Testing Hashes on a bloom filter with m=#{bf.m}"
    things_to_hash = ["word", "article", "a thingy"]

    things_to_hash.each do |thing|
      ap thing
      ap bf.hash_md5_max thing, bf.m
      ap bf.hash_md5_lower thing, bf.m
      ap bf.hash_md5_middle thing, bf.m
      ap bf.hash_md5_upper thing, bf.m
    end
  end

  def test_hashes
    hashes 12000
    hashes 162000
    hashes 5030000
  end

  def test_bloom
    bf = BloomFilter.new( 15000, 7 )

    ap "Adding objects to a bloom filter with m=#{bf.m} k=#{bf.k}"
    bf.add_object "yanko"
    assert( bf.contains_object? "yanko" )
    bf.add_object "oh my god becky"
    assert( bf.contains_object? "oh my god becky" )
    bf.add_object "lolwut"
    assert( bf.contains_object? "lolwut" ) 
  end
end