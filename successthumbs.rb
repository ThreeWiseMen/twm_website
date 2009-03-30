#!/usr/bin/ruby

system("rm -f public/images/success/*.png")

Dir.entries("public/pdf/success").each do |f|
  if f.match /\.pdf$/
     png = f.gsub /\.pdf$/, ".png"
     system("convert \"public/pdf/success/#{f}\" -antialias -resize 170x220 \"public/images/success/#{png}\"")
  end
end

