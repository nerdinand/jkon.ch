---
layout: page
ref: index
title: JKON 2021
lang: en
---

{%- assign artists = site.artists | where: "artist.year", "2021" | map: "artist" -%}

{%- case site.data.phase.phase -%}
  {%- when "new_date_announced" -%}
    {%- include index/date-announcement.en.md -%}

  {%- when "schedule_announced" -%}
    {%- include index/date-announcement.en.md -%}

    {%- include index/opening-hours.en.md -%}

  {%- when "call_for_artists_running" -%}
    {%- include index/date-announcement.en.md -%}
    
    {%- include index/call-for-artists.en.md -%}
    
    {%- include index/opening-hours.en.md -%}

  {%- when "call_for_artists_closed" -%}
    {%- include index/date-announcement.en.md -%}

    {%- include index/opening-hours.en.md -%}

  {%- when "list_of_artists_announced" -%}
    {%- include index/date-announcement.en.md -%}
    
    {%- include index/artist-names.html artists=artists -%}

    {%- include index/opening-hours.en.md -%}
    
  {%- when "artist_portraits_online" -%}
    {%- include index/date-announcement.en.md -%}

    <p>
      {%- include index/artist-links.html artists=artists -%}
    </p>

    {%- include index/opening-hours.en.md -%}
        
    {%- include index/flyer.en.md -%}
{%- endcase -%}

{%- if site.data.phase.call_for_help -%}
  {%- include index/call-for-help.md -%}
{%- endif -%}
