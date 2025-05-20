# frozen_string_literal: true

require 'icalendar'
require 'pry-byebug'

@description = 'Junge Kunst Olten 2025'
@url = 'https://www.jkon.ch'
@location = 'Kunstverein Olten, Hübelistrasse 30, 4600 Olten'

def create_ical(file_name, dtstart, summary)
  cal = Icalendar::Calendar.new

  cal.event do |event|
    event.dtstart     = dtstart
    event.summary     = summary
    event.description = @description
    event.location    = @location
    event.url         = @url
  end

  cal.publish
  File.write(file_name, cal.to_ical)
end

create_ical('../../ical/jkon2025-vernissage.ics', DateTime.civil(2025, 8, 30, 17, 15), 'JKON 2025 Vernissage')
create_ical('../../ical/jkon2025-finissage.ics', DateTime.civil(2025, 9, 27, 16, 15), 'JKON 2025 Finissage')
