# frozen_string_literal: true

require 'icalendar'
require 'pry-byebug'

cal = Icalendar::Calendar.new

summary = 'JKON 2022'
description = 'Junge Kunst Olten 2022'
url = 'https://www.jkon.ch'

location_schuetzi = 'Schützi Olten, Schützenmattweg 7, 4600 Olten'

# Thursday
cal.event do |event|
  event.dtstart     = DateTime.civil(2022, 8, 25, 18, 0)
  event.dtend       = DateTime.civil(2022, 8, 25, 22, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Friday
cal.event do |event|
  event.dtstart     = DateTime.civil(2022, 8, 26, 18, 0)
  event.dtend       = DateTime.civil(2022, 8, 26, 22, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Saturday
cal.event do |event|
  event.dtstart     = DateTime.civil(2022, 8, 27, 16, 0)
  event.dtend       = DateTime.civil(2022, 8, 27, 19, 0)
  event.summary     = summary
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Opening
cal.event do |event|
  event.dtstart     = DateTime.civil(2022, 8, 25, 18, 30)
  event.summary     = 'JKON 2022 Vernissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Closing
cal.event do |event|
  event.dtstart     = DateTime.civil(2022, 8, 27, 17, 30)
  event.summary     = 'JKON 2022 Finissage'
  event.description = description
  event.location    = location_schuetzi
  event.url         = url
end

# Guided tours
[DateTime.civil(2022, 8, 26, 19, 0), DateTime.civil(2022, 8, 27, 16, 0)].each do |datetime|
  cal.event do |event|
    event.dtstart     = datetime
    event.summary     = 'JKON 2022 Werkgespräche'
    event.description = description
    event.location    = location_schuetzi
    event.url         = url
  end
end

cal.publish

File.write('../../ical/jkon2022.ics', cal.to_ical)
