{% assign global = site.translations[site.lang].global %}

{% assign title = site.translations[site.lang].global.meta_title %}
  {% if page.title %}
    {% capture page_title %}{% t page.title %} | {{ title }}{% endcapture %}
    {% assign title = page_title %}
  {% endif %}

{% assign description = site.translations[site.lang].global.meta_descritpion %}
  {% if page.description %}
    {% capture page_description %}{% t page.description %}{% endcapture %}
    {% assign description = page_description %}
  {% endif %}

{% assign keywords = site.translations[site.lang].global.meta_keywords %}
  {% if page.keywords %}
    {% capture page_keywords %}{% t page.keywords %}{% endcapture %}
    {% assign keywords = page_keywords %}
  {% endif %}

  <head>
  <meta name="keywords" content="{{ keywords }}">
  <meta name="description" content="{{ description }}">
  <title>{{ title }}</title>
</head>