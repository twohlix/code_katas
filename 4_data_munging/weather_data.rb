require_relative "shared_functionality"
usage_check ARGV

def inside_pre line
  if line.include? 'Dy'
    @header_format = line.scan(/(\S+)(\s+)/).map{|f, s| "A#{f.size}" + 'x' * s.size}.join
    @start_spaces = line.index('Dy')
    @headers = line[@start_spaces..-1].unpack @header_format
  elsif !@header_format.nil? && line.length > @start_spaces
    line = line[@start_spaces..-1] # fix the spaces on the front
    @max_length = line.length if line.length > @max_length
    pad line, @max_length
    to_add = Hash[@headers.zip line.unpack(@header_format).map(&:strip)]
    @data[ to_add['Dy'].to_s ] = to_add
  end
end

# read our .dat file and build the data
@data = Hash.new
@header_format = nil
@headers = nil
@start_spaces = 0
@max_length = 0
read_from_filename ARGV[0], method(:inside_pre)  

# go through data and find smallest temp spread
# MxT - MnT
min_spread = 100000000
min_day = nil
@data.each do |day, vals|
  temp_spread = vals['MxT'].to_i - vals['MnT'].to_i
  if temp_spread < min_spread
    min_day = day
    min_spread = temp_spread
  end
end

puts min_day