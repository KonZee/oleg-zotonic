{% for lang in id.language %}
	{% if lang == m.translation.language %}


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

	<div class="featured-image">
	</div>
	<div class="entry-content">
		<a class="summary-link" href="{{ m.rsc[id].page_url }}">
			{{ m.rsc[id].id|summary:300 }}
		</a>

	{% if m.rsc[id].is_editable %}
		<div class="entry-meta">
			{% include "_edit_button.tpl" id=id %}
		</div>
	{% endif %}
	<a href="{{ m.rsc[id].page_url }}" class="more-link">{_ Continue reading _} <span class="meta-nav">→</span></a></p>
	</div>
</article>

	{% endif %}
{% endfor %}