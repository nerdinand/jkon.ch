---
layout: page
ref: index
title: JUNGE KUNST OLTEN 2020
lang: de
---

{%- case site.data.phase.phase -%}
  {%- when "new_date_announced" -%}
    {%- include index/date-announcement.md -%}

  {%- when "schedule_announced" -%}
    {%- include index/date-announcement.md -%}

    {%- include index/opening-hours.md -%}

  {%- when "call_for_artists_running" -%}
    {%- include index/date-announcement.md -%}
    
    {%- include index/call-for-artists.md -%}
    
    {%- include index/opening-hours.md -%}

  {%- when "call_for_artists_closed" -%}
    {%- include index/date-announcement.md -%}

    {%- include index/opening-hours.md -%}

  {%- when "list_of_artists_announced" -%}
    {%- include index/date-announcement.md -%}
    
    {%- include index/artist-names.html -%}

    {%- include index/opening-hours.md -%}
    
  {%- when "artist_portraits_online" -%}
    {%- include index/date-announcement.md -%}

    <p>
      {%- include index/artist-links.md -%}
    </p>

    {%- include index/opening-hours.md -%}

    {%- include index/flyer.md -%}
{%- endcase -%}

{%- if site.data.phase.call_for_help -%}
  {%- include index/call-for-help.md -%}
{%- endif -%}
