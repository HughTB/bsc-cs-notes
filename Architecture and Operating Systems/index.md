# Architecture and Operating Systems

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
   {% for doc in doclist %}
        {% if doc.name contains '.md' and doc.dir contains 'Architecture and Operating Systems/' %}
            <li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.name }}</a></li>
        {% endif %}
    {% endfor %}
</ul>