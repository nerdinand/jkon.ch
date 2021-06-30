### Öffnungszeiten

|{{ site.data.phase.dates.jkon.day1.date.de }}|{{ site.data.phase.dates.jkon.day1.time.de }}|
|{{ site.data.phase.dates.jkon.day2.date.de }}|{{ site.data.phase.dates.jkon.day2.time.de }}|
|{{ site.data.phase.dates.jkon.day3.date.de }}|{{ site.data.phase.dates.jkon.day3.time.de }}|

Die __Vernissage__ findet {{ site.data.phase.dates.jkon.opening.de }} statt.

__Führung und Werkgespräche__: 
{% assign guided_tours = site.data.phase.dates.jkon.guided_tours | map: 'de' %}
{% for guided_tour in guided_tours %}
{{ guided_tour }}
{% endfor %}

Die __Finissage__ mit Preisverleihung findet {{ site.data.phase.dates.jkon.finissage.de }} statt.

[Zu meinem Kalender hinzufügen](scripts/ical-script/jkon2021.ics)

