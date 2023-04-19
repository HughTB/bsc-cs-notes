# Database Systems Development

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
{% for doc in doclist %}
{% if doc.name contains '.md' and doc.dir contains 'Database%20Systems%20Development/' %}
<li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.dir | url_decode | remove: "/Database Systems Development/" }}{{ doc.name }}</a></li>
{% endif %}
{% endfor %}
</ul>