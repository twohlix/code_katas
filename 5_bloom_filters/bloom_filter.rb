require 'bitarray'
class BloomFilter

  def new m_size=10000
    @m = m_size
    init_filter
  end

  def k
    @hashes.length
  end

  def add_hash callback
    @hashes << callback
  end

  private
  def init_filter
    @bloom = BitArray.new(@m)
    @hashes = Array.new
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

end