require 'icalendar'
require 'pry-byebug'

cal = Icalendar::Calendar.new

summary = 'JKON 2019'
description = 'Junge Kunst Olten 2019'
url = 'https://www.jkon.ch'

location_schuetzi = 'Schützi Olten, Schützenmattweg 15, 4600 Olten'
location_coq_d_or = "Kulturlokal Coq d'Or, Tannwaldstrasse 48, 4600 Olten"

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 22, 18, 0)
  event.dtend       = DateTime.civil(2019, 8, 22, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 23, 16, 0)
  event.dtend       = DateTime.civil(2019, 8, 23, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 24, 10, 0)
  event.dtend       = DateTime.civil(2019, 8, 24, 21, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 22, 18, 30)
  event.summary     = 'JKON 2019 Vernissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 24, 17, 30)
  event.summary     = 'JKON 2019 Finissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

cal.event do |event|
  event.dtstart     = DateTime.civil(2019, 8, 24, 21, 0)
  event.summary     = 'JKON 2019 Afterparty'
  event.description = description
  event.location    = location_coq_d_or
  event.url         = url
end

cal.publish

File.write('jkon2019.ics', cal.to_ical)
