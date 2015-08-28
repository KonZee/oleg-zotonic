{% with m.config.i18n.language_list.list as list %}
{% if list %}
<li>
	{# Single menu item for switch language #}
	{% for code,lang in list %}
		{% if lang.is_enabled and m.translation.language != code %}
			<a href="{% url language_select code=code p=m.req.raw_path %}">{_ Switch language _}</a>
		{% endif %}
	{% endfor %}
	{# List of languages #}
	<ul>
		{% for code,lang in list %}
			{% if all or lang.is_enabled %}
				<li>
					<a id="{{ #lang.code }}" href="{% url language_select code=code p=m.req.raw_path %}">
						{% if code == 'ru' and m.translation.language != 'ru' %}
							Russian
						{% else %}
							{{ lang.language }}
						{% endif %}
					</a>
				</li>
			{% endif %}
		{% endfor %}

	</ul>

</li>
{% endif %}
{% endwith %}
