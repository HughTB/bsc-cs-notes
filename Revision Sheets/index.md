# Networks

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
{% for doc in doclist %}
{% if doc.name contains '.md' and doc.dir contains 'Revision%20Sheets/' %}
<li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.dir | url_decode | remove: "/Revision Sheets/" }}{{ doc.name }}</a></li>
{% endif %}
{% endfor %}
</ul>