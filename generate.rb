require 'json'
require 'rake'
require 'open-uri'
require 'erubis'

images = nil
repo = "https://raw.githubusercontent.com/dotabuff/d2vpkr/master"

open("#{repo}/dota/scripts/emoticons.json") do |file|
  parsed = JSON.parse(file.read)
  images = parsed["emoticons"]
end

emotes = []

images.each do |image|
  image_name = image["image_name"]
  alias_name = image["aliases"].first
  source = "assets/images/emoticons/#{image_name}"

  unless File.file?(source)
    source_url = "#{repo}/dota/resource/flash3/images/emoticons/#{image_name}"
    open(source_url, 'rb') do |from|
      open(source, 'wb') do |to|
        puts "Downloading: #{source_url} => #{source}..."
        len = IO.copy_stream(from, to)
        puts "Copied #{len} bytes"
      end
    end
  end

  cmd_split = "convert +repage '#{source}' -crop 32x32 tmp/tiles.png"
  sh cmd_split
  cmd_rename = "for file in tmp/tiles-?.png; do mv $file tmp/tiles-0$(echo \"$file\" | cut -d'-' -f 2); done"
  system cmd_rename

  tick_delay = image["ms_per_frame"].to_i/10

  cmd_assemble32 = "convert -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{alias_name}.gif"
  sh cmd_assemble32

  # -sample instead of -resize fixes losing transparency on 16x16, see http://www.imagemagick.org/discourse-server/viewtopic.php?t=19787
  cmd_assemble16 = "convert -sample 16x16 -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{alias_name}-16.gif"
  sh cmd_assemble16

  cmd_assemble24 = "convert -resize 24x24 -dispose 2 +repage -delay #{tick_delay} -loop 0 tmp/*.png assets/images/#{alias_name}-24.gif"
  sh cmd_assemble24

  sh "rm tmp/*.png"
  puts "Generated: #{alias_name}.gif"
  emotes << {
      name: alias_name,
      image: image_name,
      width: `identify -format "%w" assets/images/emoticons/#{image_name}`.to_i,
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
