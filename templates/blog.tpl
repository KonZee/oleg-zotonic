{% extends "base.tpl" %}

{% block classes %}blog{% endblock %}

{% block content %}
	{% with m.search.paged[{query cat='blog' sort='-publication_start' pagelen=m.config.site.pagelen.value page=q.page language=language}] as result %}
		{% if result %}
			{% for id in result %}
				{% include "article_summary.tpl" id=id %}
			{% endfor %}
			{% pager result=result dispatch='blog' id=id hide_single_page %}
		{% else %}
			Sorry. There are no posts in the blog section.
		{% endif %}
	{% endwith %}
{% endblock %}