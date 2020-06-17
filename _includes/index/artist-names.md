{{ site.data.artists.a2020 | where: 'cancelled', false | map: 'short_name' | join: ', ' }}
