{% extends "base.tpl" %}

{% block title %}{_ Keyword _}: {{ m.rsc[id].title }}{% endblock %}

{% block classes %}keyword{% endblock %}

{% block content %}
	<div id="primary" class="site-content post-archive">
		{% with m.search.paged[{referrers id=m.rsc[id].id page=q.page pagelen=m.config.site.pagelen.value}] as result %}
			<header class="page-header">
				<h1 class="page-title">{_ Keyword _} <span class="on">→</span> <span>{{ m.rsc[id].title }}</span></h1>
			</header>
			{% if result|length > 0 %}
				{% for id, predicate in result %}
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
				{% pager result=result dispatch='keyword' id=id slug=m.rsc[id].slug hide_single_page %}
			{% else %}
				{_ Did not find any pages matching _} <b class="qs">{{ q.qs|escape }}</b>.
			{% endif %}
		{% endwith %}
	</div>

{#
	<header class="entry-header">
		<h3>
			{_ Keyword _}: {{ m.rsc[id].title }}
		</h3>
	</header>
	{% with m.search.paged[{referrers id=m.rsc[id].id page=q.page pagelen=m.config.site.pagelen.value}] as result %}
		{% for id, predicate in result %}
			{% include "article_summary.tpl" id=id %}
		{% endfor %}
		{% pager result=result dispatch='keyword' id=id slug=m.rsc[id].slug hide_single_page %}
	{% endwith %}
#}
{% endblock %}