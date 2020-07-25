SOURCE_DIR = '../../images/artists/2020/original'
BIG_DIR = '../../images/artists/2020/big'
SMALL_DIR = '../../images/artists/2020/small'

Dir["#{SOURCE_DIR}/*"].each do |original_file|
  filename = File.basename(original_file)
  `convert #{original_file} -resize 740x\\> #{BIG_DIR}/#{filename}`
  `convert #{original_file} -resize 240x\\> #{SMALL_DIR}/#{filename}`
end
