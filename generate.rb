require 'vdf4r'
require 'erubis'

images = nil

File.open('src/scripts/emoticons.txt') do |file|
  parser = VDF4R::Parser.new(file)
  images = parser.parse["emoticons"]
end

emotes = []

images.each do |obj|
  image = obj[1]
  cmd_split = "convert +repage assets/images/emoticons/#{image["image_name"]} -crop 32x32 tmp/tiles.png"
  system cmd_split
  cmd_rename = "for file in tmp/tiles-?.png; do mv $file tmp/tiles-0$(echo \"$file\" | cut -d'-' -f 2); done"
  system cmd_rename

  tick_delay = image["ms_per_frame"].to_i/10

  cmd_assemble32 = "convert -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{image["aliases"]["0"]}.gif"
  system cmd_assemble32

  cmd_assemble16 = "convert -resize 16x16 -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{image["aliases"]["0"]}-16.gif"
  system cmd_assemble16

  cmd_assemble24 = "convert -resize 24x24 -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{image["aliases"]["0"]}-24.gif"
  system cmd_assemble24

  system "rm tmp/*.png"
  puts "Generated: #{image["aliases"]["0"]}.gif"
  emotes << {
      name: image["aliases"]["0"],
      image: image["image_name"],
      width: `identify -format "%w" assets/images/emoticons/#{image["image_name"]}`.to_i,
      delay: image["ms_per_frame"].to_f/1000
  }
end

# generate stylsheet for png stuff
sheet = File.read('src/stylesheet.css.eruby')
eruby = Erubis::Eruby.new(sheet)

File.open("assets/stylesheets/dota2-chat-emoticons.css", "w") do |f|
  f.write(eruby.result(:emotes=>emotes))
end

puts "Generated: CSS Animation Stylesheet"

demo = File.read('src/demo.html.eruby')
eruby = Erubis::Eruby.new(demo)

File.open("demo.html", "w") do |f|
  f.write(eruby.result(:emotes=>emotes))
end

puts "Generated: CSS Animation Demo HTML"

readme = File.read('src/README.md.eruby')
eruby = Erubis::Eruby.new(readme)

File.open("README.md", "w") do |f|
  f.write(eruby.result(:emotes=>emotes))
end

puts "Generated: README file"

puts "Done!"

#convert +repage src/resource/flash3/images/emoticons/blush.png -crop 32x32 tmp/tiles.png
#convert +repage -delay 100 -loop 0 tmp/*.png blush.gif
