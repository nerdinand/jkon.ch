# frozen_string_literal: true

if ARGV.size != 2
  puts 'Usage: ruby resize.rb <source_dir> <destination_dir>'
  puts '  e.g. `ruby resize.rb ../../images/artists/original/2022/ ../../images/artists/2022/`'
  puts '  Script assumes that <destination_dir> contains the subdirectories `big`, `small`.'
  puts '  Will generate resized images for each image in `source_dir` and store them in'
  puts '  `destination_dir/big` and `destination_dir/small`.'
  exit(1)
end

source_dir = ARGV[0]
destination_dir = ARGV[1]

ORIGINAL_DIR = "#{source_dir}/original".freeze
BIG_DIR = "#{destination_dir}/big".freeze
SMALL_DIR = "#{destination_dir}/small".freeze

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
