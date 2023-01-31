# Architecture and Operating Systems

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
   {% for doc in doclist %}
        {% if doc.name contains '.md' and doc.dir contains 'Architecture%20and%20Operating%20Systems/' %}
            <li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.dir | url_decode | remove: "/Architecture and Operating Systems/" }}{{ doc.name }}</a></li>
        {% endif %}
    {% endfor %}
</ul>