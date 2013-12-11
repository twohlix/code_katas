require "awesome_print"

def usage_check args
  if args.length < 1
    puts "usage: #{$0} filename.dat"
    exit 0
  end
end

def read_from_filename filename, callback
  # get the .dat file
  data_file = File.new(filename, "r")

  # read our .dat file and call the callback with the line
  inside_pre = false
  while (line = data_file.gets)
    inside_pre = true if line.include? '<pre>'
    inside_pre = false if line.include? '</pre>'

    if inside_pre
      callback.call line
    end
  end
  
  data_file.close
end

# pads with whitespace
def pad str, max_length
  if str.length >= max_length
    return str
  end

  str << ' '*(max_length - str.length)
end