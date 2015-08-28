{% for id, count in m.search[{keyword_cloud cat=['page_blog','page_works', 'page_media']}] %}
	{% for lang in id.language %}
		{% if lang == m.translation.language%}
			<a href="{{ id.page_url }}">{{ id.title }}</a>{% if not forloop.parentloop.last %},{% else %}.{% endif %}
		{% endif %}
	{% endfor %}
{% endfor %}