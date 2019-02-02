---
layout: archive
title: ""
permalink: /publications/
author_profile: true
---

You can also find my articles on <u><a href="https://scholar.google.de/citations?user=mk7kDiQAAAAJ&hl=de">my Google Scholar profile</a>.</u>

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
