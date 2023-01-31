# CCC Item 1 (Video Essay)

{% assign doclist = site.pages | sort: 'url'  %}
<ul>
   {% for doc in doclist %}
        {% if doc.name contains '.md' and doc.dir contains 'CCC Item 1/' %}
            <li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.name }}</a></li>
        {% endif %}
    {% endfor %}
</ul>