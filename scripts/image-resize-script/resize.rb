SOURCE_DIR = '../../images/artists/2019/original'
BIG_DIR = '../../images/artists/2019/big'
SMALL_DIR = '../../images/artists/2019/small'

Dir["#{SOURCE_DIR}/*"].each do |original_file|
  filename = File.basename(original_file)
  `convert #{original_file} -resize 740x\\> #{BIG_DIR}/#{filename}`
  `convert #{original_file} -resize "240x320^" -gravity center -crop 240x320+0+0 +repage #{SMALL_DIR}/#{filename}`
end
