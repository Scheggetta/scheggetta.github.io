---
layout: page
title: Home
---

# IMO an AGI wouldn't hurt now

Hello 🌍, my name is Edoardo Fusa, and I am currently pursuing a Master's degree in Artificial Intelligence at the
University of Bologna. I love science, and I love even more to talk about it with other people.

To understand my way of reasoning, you should know that I have a Computer Science background, so the way I approach
problems is very pragmatic. I like to think that I am a problem solver, but also a very methodical and lazy person
at the same time.

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

You can find the repo of this site [here](https://github.com/Scheggetta/scheggetta.github.io).

<style>
  .wrapper-main-content {
    max-width: 46em;
  }
</style>
