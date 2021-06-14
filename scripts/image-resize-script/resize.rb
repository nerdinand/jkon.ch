SOURCE_DIR = '../../images/past-exhibitions/2020/original'
BIG_DIR = '../../images/past-exhibitions/2020/big'
SMALL_DIR = '../../images/past-exhibitions/2020/small'

BIG_MAX_WIDTH = 740
SMALL_MAX_WIDTH = 240
SMALL_MAX_HEIGHT = 320

Dir["#{SOURCE_DIR}/*"].each do |original_file|
  filename = File.basename(original_file)
  puts filename
  `convert #{original_file} -resize #{BIG_MAX_WIDTH}x\\> #{BIG_DIR}/#{filename}`
  `convert #{original_file} -resize "#{SMALL_MAX_WIDTH}x#{SMALL_MAX_HEIGHT}^" -gravity center -crop #{SMALL_MAX_WIDTH}x#{SMALL_MAX_HEIGHT}+0+0 +repage #{SMALL_DIR}/#{filename}`
end
