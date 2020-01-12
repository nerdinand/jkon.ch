require 'icalendar'
require 'pry-byebug'

cal = Icalendar::Calendar.new

summary = 'JKON 2020'
description = 'Junge Kunst Olten 2020'
url = 'https://www.jkon.ch'

location_schuetzi = 'Schützi Olten, Schützenmattweg 15, 4600 Olten'
# location_coq_d_or = "Kulturlokal Coq d'Or, Tannwaldstrasse 48, 4600 Olten"

cal.event do |event|
  event.dtstart     = DateTime.civil(2020, 8, 13, 18, 0)
  event.dtend       = DateTime.civil(2020, 8, 13, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2020, 8, 14, 17, 0)
  event.dtend       = DateTime.civil(2020, 8, 14, 20, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2020, 8, 15, 16, 0)
  event.dtend       = DateTime.civil(2020, 8, 15, 19, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2020, 8, 13, 18, 30)
  event.summary     = 'JKON 2020 Vernissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2020, 8, 15, 17, 30)
  event.summary     = 'JKON 2020 Finissage'
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

File.write('jkon2020.ics', cal.to_ical)
