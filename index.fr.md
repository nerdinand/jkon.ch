---
layout: page
ref: index
title: JKON 2020
lang: fr
---


{%- case site.data.phase.phase -%}
  {%- when "new_date_announced" -%}
    {%- include index/date-announcement.fr.md -%}

  {%- when "schedule_announced" -%}
    {%- include index/date-announcement.fr.md -%}

    {%- include index/opening-hours.fr.md -%}

  {%- when "call_for_artists_running" -%}
    {%- include index/date-announcement.fr.md -%}
    
    {%- include index/call-for-artists.fr.md -%}
    
    {%- include index/opening-hours.fr.md -%}

  {%- when "call_for_artists_closed" -%}
    {%- include index/date-announcement.fr.md -%}

    {%- include index/opening-hours.fr.md -%}

  {%- when "list_of_artists_announced" -%}
    {%- include index/date-announcement.fr.md -%}
    
    <p>
      {%- include index/artist-names.md -%}
    </p>

    {%- include index/opening-hours.fr.md -%}
    
  {%- when "artist_portraits_online" -%}
    {%- include index/date-announcement.fr.md -%}

    <p>
      {%- include index/artist-links.md -%}
    </p>

    {%- include index/opening-hours.fr.md -%}

    {% comment %}
    {%- include index/flyer.fr.md -%}
    {% endcomment %}
{%- endcase -%}

{%- if site.data.phase.call_for_help -%}
  {%- include index/call-for-help.md -%}
{%- endif -%}
