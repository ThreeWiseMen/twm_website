#!/usr/bin/ruby

def process dir
  Dir.entries(dir).each do |f|
    fname = "#{dir}/#{f}"
    if File.directory? fname and not fname.match /\/\./
      process fname
    else
      crush fname if fname.match /\.png$/
    end
  end
end

def crush fname
  puts "Crushing #{fname}"
  system "pngcrush -reduce -rem gAMA -rem cHRM -rem iCCP -rem sRGB \"#{fname}\" \"#{fname}.t\""
  system "mv \"#{fname}.t\" \"#{fname}\""
end

process "public"

