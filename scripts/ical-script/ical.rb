require 'icalendar'
require 'pry-byebug'

cal = Icalendar::Calendar.new

summary = 'JKON 2021'
description = 'Junge Kunst Olten 2021'
url = 'https://www.jkon.ch'

location_schuetzi = 'Schützi Olten, Schützenmattweg 7, 4600 Olten'
# location_coq_d_or = "Kulturlokal Coq d'Or, Tannwaldstrasse 48, 4600 Olten"

# Thursday
cal.event do |event|
  event.dtstart     = DateTime.civil(2021, 8, 5, 18, 0)
  event.dtend       = DateTime.civil(2021, 8, 5, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Friday
cal.event do |event|
  event.dtstart     = DateTime.civil(2021, 8, 6, 18, 0)
  event.dtend       = DateTime.civil(2021, 8, 6, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Saturday
cal.event do |event|
  event.dtstart     = DateTime.civil(2021, 8, 7, 16, 0)
  event.dtend       = DateTime.civil(2021, 8, 7, 19, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Opening
cal.event do |event|
  event.dtstart     = DateTime.civil(2021, 8, 5, 18, 30)
  event.summary     = 'JKON 2021 Vernissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Closing
cal.event do |event|
  event.dtstart     = DateTime.civil(2021, 8, 7, 17, 30)
  event.summary     = 'JKON 2021 Finissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# cal.event do |event|
#   event.dtstart     = DateTime.civil(2019, 8, 24, 21, 0)
#   event.summary     = 'JKON 2019 Afterparty'
#   event.description = description
#   event.location    = location_coq_d_or
#   event.url         = url
# end

cal.publish

File.write('jkon2021.ics', cal.to_ical)
