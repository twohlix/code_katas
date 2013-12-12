require 'bitarray'
class BloomFilter
  require 'digest'

  def initialize m_size=10000, k_size=3
    @m = m_size
    @k = [k_size, k_max].min
    init_filter
  end

  def k
    @k
  end

  # assumes md5 usage
  def k_max
    chars_needed = hex_chars_needed_for @m
    32 / chars_needed
  end

  def m
    @m
  end

  def add_object obj
    return false if contains_object? obj

    bits_to_set = hash_md5_max obj, @m
    (0..@k).each do |ind|
      bit = bits_to_set[ind]
      @bloom[bit] = 1
    end 

    # objects << obj # do I actually need to store it? probably not?
    true
  end

  def contains_object? obj
    bits_to_check = hash_md5_max obj, @m
    (0..@k-1).each do |ind|
      bit = bits_to_check[ind]
      return false if @bloom[bit] == 0
    end

    true
  end

  def debug_bitarray
    @bloom
  end

  #private
  def init_filter
    @bloom = BitArray.new(@m)
    @objects = Array.new
  end

  def bits_needed_for size
    Math.log2(m.abs).ceil
  end

  def hex_chars_needed_for size
    chars_needed_for size, 4
  end

  def chars_needed_for size, base=4
    (bits_needed_for(size) / base.to_f).ceil
  end

  def md5 obj
    Digest::MD5.hexdigest(obj)
  end

  ##############################################
  # Hash Functions
  ##############################################
  def example_hash_method obj, m
    md5_result = Digest::MD5.hexdigest(obj)
    # should return a number of 0 to m
    md5_result.to_i(16) % m
  end

  def hash_md5_lower obj, m
    chars_needed = hex_chars_needed_for m

    md5_result = md5(obj)

    md5_result.slice(0,chars_needed).to_i(16) % m
  end

  def hash_md5_upper obj, m
    chars_needed = hex_chars_needed_for m

    md5_result = md5(obj)

    md5_result.slice(0-chars_needed, chars_needed).to_i(16) % m
  end

  def hash_md5_middle obj, m
    chars_needed = hex_chars_needed_for m

    md5_result = md5(obj)

    chars_to_remove = md5_result.length - chars_needed
    md5_result = md5_result[chars_to_remove/2, chars_needed]

    md5_result.slice(0, chars_needed).to_i(16) % m
  end

  def hash_md5_max obj, m
    chars_needed = hex_chars_needed_for m
    num_chunks = 32 / chars_needed

    md5_result = md5(obj)
    chunks = Array.new(num_chunks)

    chunks.each_index do |chunk_index|
      chunks[chunk_index] = md5_result.slice(chars_needed*chunk_index, chars_needed).to_i(16) % m
    end

    chunks
  end

end