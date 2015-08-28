{% extends "base.tpl" %}

{% block classes %}search{% endblock %}

{% block title %}Search {{q.qs}}{% endblock %}

{% block content %}
	<div id="primary" class="site-content post-archive">
		{% with m.search.paged[{query text=q.qs cat=['blog','works','press', 'person', 'text'] pagelen=m.config.site.pagelen.value page=q.page}] as result %}
			<header class="page-header">
				<h1 class="page-title">{_ Search Results _} <span class="on">→</span> <span>{{q.qs}}</span></h1>
			</header>
			{% if result|length > 0 %}
				{% for id in result %}
			<article class="post type-post hentry">

				<header class="entry-header">
					<h1 class="entry-title">
						<a href="{{ m.rsc[id].page_url }}">
							{{ m.rsc[id].title }}
						</a>
					</h1>
				</header>

				<div class="entry-meta">
					<time class="entry-date" datetime="{{ m.rsc[id].publication_start|date:"Y-b-d H:i":"UTC"}}">{{ m.rsc[id].publication_start|date:"Y-b-d H:i":"UTC"}}</time></a>
					<span class="comments-link">
						<a href="{{ m.rsc[id].page_url }}#comments" title="{{ m.rsc[id].title }}">{{m.comment.rsc[id]|length}} {_ comments _}</a>
					</span>
				</div>

				<div class="entry-content">
					<a class="summary-link" href="{{ m.rsc[id].page_url }}">
						{{ m.rsc[id].id|summary:300 }}
					</a>
				</div>
				{% if m.rsc[id].is_editable %}
					<div class="entry-meta">
						{% include "_edit_button.tpl" id=id %}
					</div>
				{% endif %}
			</article>
				{% endfor %}
				{% pager result=result hide_single_page %}
			{% else %}
				{_ Did not find any pages matching _} <b class="qs">{{ q.qs|escape }}</b>.
			{% endif %}
		{% endwith %}
	</div>
{% endblock %}