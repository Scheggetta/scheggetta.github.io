---
layout: page
title: Home
---

# Welcome 🌍!
  
  
This is my digital garden. It's a collection of notes, thoughts, and ideas that I'm actively cultivating. Unlike a blog, this isn't a chronological archive of my latest thoughts. Instead, it's an evolving compendium of my knowledge and observations.
> You can think of this blog as an experiment.

<strong>Recently updated posts</strong>

<ul>
  {% assign recent_posts = site.posts %}
  {% for page in recent_posts limit: 4 %}
    <li>
      {{ page.date | date_to_string }} — <a class="internal-link" href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a>
    </li>
  {% endfor %}
</ul>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
