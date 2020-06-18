require 'yaml'

ARTISTS_DIRECTORY = './_data/artists/a2020'
IMAGES_DIRECTORY = '/images/artists/2020/'

task :add_artist, [:name] do |t, args|
  yaml_string = {
    'short_name' => args.name,
    'persons' => [args.name],
    'website_url' => nil,
    'portrait_image' => IMAGES_DIRECTORY,
    'biography' => nil,
    'artwork_images' => [IMAGES_DIRECTORY],
    'art_description' => nil,
    'cancelled' => false,
  }.to_yaml
  
  file_name = "#{args.name.downcase.gsub(/[^a-z]/, '-')}.yml"

  File.write(File.join(ARTISTS_DIRECTORY,  file_name), yaml_string)
end
