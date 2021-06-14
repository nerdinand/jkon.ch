# frozen_string_literal: true

artist_list = "Aathmigan Jegatheeswaran
Andrea Francesco Todisco
Emanuel Heim
Cheyenne Oswald
Stéphanie Kiser
Victoria Holdt
Lorenz Fischer
Chevalley Line
Mina Achermann
Irene Gazillo
Genevieve Leong
Alexandra Feusi
Zhaoyue Fan
Nathalie Stirnimann & Stefan Stojanovic"

artist_names = artist_list.split("\n")

template_source = File.read('scripts/create-artists-script/template.html')

year = 2021

artist_names.each do |artist_name|
  File.write(
    "_artists/#{year}/#{artist_name}.html",
    template_source.gsub('__NAME__', artist_name).gsub('__YEAR__', year.to_s)
  )
end
