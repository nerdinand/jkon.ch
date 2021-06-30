### Horaires d'ouvertures de l'exposition

|{{ site.data.phase.dates.jkon.day1.date.fr }}|{{ site.data.phase.dates.jkon.day1.time.fr }}|
|{{ site.data.phase.dates.jkon.day2.date.fr }}|{{ site.data.phase.dates.jkon.day2.time.fr }}|
|{{ site.data.phase.dates.jkon.day3.date.fr }}|{{ site.data.phase.dates.jkon.day3.time.fr }}|

La __vernissage__ aura lieu {{ site.data.phase.dates.jkon.opening.fr }}.

__Visite guidée & débats artistiques__: 
{% assign guided_tours = site.data.phase.dates.jkon.guided_tours | map: 'fr' %}
{% for guided_tour in guided_tours %}
{{ guided_tour }}
{% endfor %}

La __clôture__, y compris la remise des prix, aura lieu le {{ site.data.phase.dates.jkon.finissage.fr }}.

[Ajouter à mon calendrier](scripts/ical-script/jkon2021.ics)

