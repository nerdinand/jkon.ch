### Opening hours of the exhibition

|{{ site.data.phase.dates.jkon.day1.date.en }}|{{ site.data.phase.dates.jkon.day1.time.en }}|
|{{ site.data.phase.dates.jkon.day2.date.en }}|{{ site.data.phase.dates.jkon.day2.time.en }}|
|{{ site.data.phase.dates.jkon.day3.date.en }}|{{ site.data.phase.dates.jkon.day3.time.en }}|

The __opening__ takes place {{ site.data.phase.dates.jkon.opening.en }}. 

__Guided tour & meet the artists__: 
{% assign guided_tours = site.data.phase.dates.jkon.guided_tours | map: 'en' %}
{% for guided_tour in guided_tours %}
{{ guided_tour }}
{% endfor %}

The __finissage__, including the award ceremony, takes place at {{ site.data.phase.dates.jkon.finissage.en }}. 

[Add to my calendar](scripts/ical-script/jkon{{site.data.phase.dates.jkon.year}}.ics)

