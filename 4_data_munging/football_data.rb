if ARGV.length < 1
  puts "usage: #{$0} filename.dat"
  exit 0
end

require "awesome_print"

# get the .dat file
data_filename = ARGV[0]
data_file = File.new(data_filename, "r")
data = Array.new

# read our .dat file and build the data
inside_pre = false
headers = nil
start_spaces = 0
line = nil
max_length = 0
while (line = data_file.gets)
  inside_pre = true if line.include? '<pre>'
  inside_pre = false if line.include? '</pre>'

  if inside_pre
    line.tr!('-','')
    if line.include? 'Team'
      # header line
      start_spaces = line.index('Team')
      headers = line[start_spaces..-1].split
    elsif !headers.nil? && line.length > start_spaces
      vals = line[start_spaces..-1].split
      to_add = Hash[headers.zip vals]
      data << to_add
    end
  end
end
data_file.close

# find team with smallest For and Against difference
min_spread = 10000000000
min_team = nil
data.each do |team_vals|
  next if team_vals['F'].nil? || team_vals['A'].nil?
  temp_spread = team_vals['F'].to_i - team_vals['A'].to_i
  temp_spread = temp_spread.abs
  if temp_spread < min_spread
    min_team = team_vals['Team']
    min_spread = temp_spread
  end
end

puts "#{min_team} with For-Against spread of #{min_spread}"