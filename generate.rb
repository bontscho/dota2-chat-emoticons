require 'vdf4r'
require 'ap'

images = nil

File.open('src/scripts/emoticons.txt') do |file|
  parser = VDF4R::Parser.new(file)
  images = parser.parse["emoticons"]
end

images.each do |obj|
  image = obj[1]
  cmd_split = "convert +repage src/resource/flash3/images/emoticons/#{image["image_name"]} -crop 32x32 tmp/tiles.png"
  system cmd_split
  cmd_rename = "for file in tmp/tiles-?.png; do mv $file tmp/tiles-0$(echo \"$file\" | cut -d'-' -f 2); done"
  system cmd_rename

  tick_delay = image["ms_per_frame"].to_i/10

  cmd_assemble = "convert -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{image["aliases"]["0"]}.gif"
  system cmd_assemble
  system "rm tmp/*.png"
  puts "Generated: #{image["aliases"]["0"]}.gif"
end

puts "Done!"

#convert +repage src/resource/flash3/images/emoticons/blush.png -crop 32x32 tmp/tiles.png
#convert +repage -delay 100 -loop 0 tmp/*.png blush.gif
