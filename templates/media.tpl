{% extends "base.tpl" %}

{% block classes %}media{% endblock %}

{% block content %}
	{% with m.search.paged[{query cat='press' sort='-publication_start' pagelen=m.config.site.pagelen.value page=q.page language=language}] as result %}
		{% if result %}
			{% for id in result %}
				{% include "article_summary.tpl" id=id %}
			{% endfor %}
			{% pager result=result dispatch='press' id=id hide_single_page %}
		{% else %}
			Oops... There is no post in media yet
		{% endif %}
	{% endwith %}
{% endblock %}