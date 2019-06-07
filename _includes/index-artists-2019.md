{% for artist_hash in site.data.artists.2019 %}
<a href="/artists#{{artist_hash[0]}}">{{ artist_hash[1].short_name }}</a>
{% endfor %}
