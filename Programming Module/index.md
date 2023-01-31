# Programming

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
   {% for doc in doclist %}
        {% if doc.name contains '.md' and doc.dir contains 'Programming%20Module/' %}
            <li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.dir | url_decode | remove: "/Programming Module/" }}{{ doc.name }}</a></li>
        {% endif %}
    {% endfor %}
</ul>