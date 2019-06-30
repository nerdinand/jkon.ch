{% for artist_hash in site.data.artists.2019 %}

{% assign artist = artist_hash[1] %}
{% assign name = artist.short_name %}

{% if artist.cancelled %}
{% assign name = name | append: " <b>ABGESAGT</b>" %}
{% endif %}

<a href="/artists#{{artist_hash[0]}}">{{ name }}</a>
{% endfor %}
