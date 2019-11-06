{% for artist_hash in site.data.artists.a2019 %}
  {% assign artist = artist_hash[1] %}
  {% assign title = artist.persons | join: ", " %}

  {% unless artist.cancelled %}

  {% if artist.website_url %}
  <a href="{{artist.website_url}}" target="_blank">
    {{ title | replace: "*", "\*" }}
  </a>
  {% else %}
  {{ title | replace: "*", "\*" }}
  {% endif %}

  {% endunless %}
{% endfor %}
