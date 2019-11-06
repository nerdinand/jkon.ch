{% for artist_hash in site.data.artists.a2019 %}

{% assign artist = artist_hash[1] %}
{% assign name = artist.short_name %}

{% unless artist.cancelled %}
<a href="/artists#{{artist_hash[0]}}">{{ name }}</a>
{% endunless %}
{% endfor %}
