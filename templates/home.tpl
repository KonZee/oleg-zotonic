{% extends "base.tpl" %}

{% block classes %}home{% endblock %}

{% block title %}{{ m.config.site.site_title.value }}{% endblock %}

{% block content %}
	<article class="page hentry">
		<header class="entry-header">
			<h1 class="entry-title">{_ About me _}</h1>
		</header>
		{% if m.rsc[id].is_editable %}
		<div class="entry-meta">
			{% include "_edit_button.tpl" id=id %}
		</div>
		{% endif %}
		<div class="entry-content">
			{{ m.rsc[id].body|show_media }}
			<hr>
		</div>
	</article>
{% endblock %}