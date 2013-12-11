if ARGV.length < 1
  puts "usage: #{$0} filename.dat"
  exit 0
end

require "awesome_print"

# pads with whitespace
def pad str, max_length
  if str.length >= max_length
    return str
  end

  str << ' '*(max_length - str.length)
end

# get the .dat file
data_filename = ARGV[0]
data_file = File.new(data_filename, "r")
data = Hash.new

# read our .dat file and build the data
inside_pre = false
header_format = nil
headers = nil
start_spaces = 0
line = nil
max_length = 0
while (line = data_file.gets)
  inside_pre = true if line.include? '<pre>'
  inside_pre = false if line.include? '</pre>'

  if inside_pre
    if line.include? 'Dy'
      # header line
      header_format = line.scan(/(\S+)(\s+)/).map{|f, s| "A#{f.size}" + 'x' * s.size}.join
      start_spaces = line.index('Dy')
      headers = line[start_spaces..-1].unpack header_format
    elsif !header_format.nil? && line.length > start_spaces
      line = line[start_spaces..-1] # fix the spaces on the front
      max_length = line.length if line.length > max_length
      pad line, max_length
      to_add = Hash[headers.zip line.unpack(header_format).map(&:strip)]
      data[ to_add['Dy'].to_s ] = to_add
    end
  end
end
data_file.close

# go through data and find smallest temp spread
# MxT - MnT
min_spread = 100000000
min_day = nil
data.each do |day, vals|
  temp_spread = vals['MxT'].to_i - vals['MnT'].to_i
  if temp_spread < min_spread
    min_day = day
    min_spread = temp_spread
  end
end

puts min_day