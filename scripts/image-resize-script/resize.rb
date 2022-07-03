# frozen_string_literal: true

if ARGV.size != 1
  puts "Usage: ruby resize.rb <root_dir>"
  puts "  e.g. `ruby resize.rb ../../images/artists/2022/`"
  puts "  Script assumes that <root_dir> contains the subdirectories `original`, `big`, `small`."
  puts "  Will generate resized images for each image in `original` and store them in `big` and `small`."
  exit(1)
end

root_dir = ARGV[0]

ORIGINAL_DIR = "#{root_dir}/original"
BIG_DIR = "#{root_dir}/big"
SMALL_DIR = "#{root_dir}/small"

BIG_MAX_WIDTH = 740
SMALL_WIDTH = 240
SMALL_HEIGHT = 320

Dir["#{ORIGINAL_DIR}/*"].each do |original_file|
  filename = File.basename(original_file)
  puts filename

  `convert "#{original_file}" \
    -resize #{BIG_MAX_WIDTH}x\\> "#{BIG_DIR}/#{filename}"`

  `convert "#{original_file}" \
    -resize "#{SMALL_WIDTH}x#{SMALL_HEIGHT}^" \
    -gravity center \
    -crop #{SMALL_WIDTH}x#{SMALL_HEIGHT}+0+0 \
    +repage "#{SMALL_DIR}/#{filename}"`
end
