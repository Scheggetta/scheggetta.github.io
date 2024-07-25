---
layout: page
title: All Posts
---

# All Posts

<ul>
  {% assign all_posts = site.posts %}
  {% for page in all_posts %}
    <li>
      {{ page.date | date_to_string }} — <a class="internal-link" href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a>
    </li>
  {% endfor %}
</ul>
