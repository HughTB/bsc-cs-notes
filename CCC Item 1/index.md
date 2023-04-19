# CCC Item 1 (Video Essay)

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
{% for doc in doclist %}
{% if doc.name contains '.md' and doc.dir contains 'CCC%20Item%201/' %}
<li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.dir | url_decode | remove: "/CCC Item 1/" }}{{ doc.name }}</a></li>
{% endif %}
{% endfor %}
</ul>