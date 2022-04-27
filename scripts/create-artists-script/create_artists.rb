# frozen_string_literal: true

artist_list = "Lars Tuchel
Noah Ismael Wyss
Manuela Cossalter
Isabelle Benvenuti
Tirza Matter
Emile Van Helleputte
Anita Moser
Benjamin Schwander
Teddy Pratt
Marc Lauber
Catherin Schöberl"

artist_names = artist_list.split("\n")

template_source = File.read('scripts/create-artists-script/template.html')

year = 2022

artist_names.each do |artist_name|
  File.write(
    "_artists/#{year}/#{artist_name}.html",
    template_source.gsub('__NAME__', artist_name).gsub('__YEAR__', year.to_s)
  )
end
