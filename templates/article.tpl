{% extends "base.tpl" %}

{% block classes %}article{% endblock %}

{% block content %}
	<div class="blog-single readable-content">
		<article class="post type-post format-standard hentry">
			<header class="entry-header">
				<h1 class="entry-title">{{m.rsc[id].title}}</h1>
			</header>
			<div class="entry-meta">
				<time class="entry-date" datetime="{{ m.rsc[id].publication_start|date:"Y-b-d H:i":"UTC"}}">{{ m.rsc[id].publication_start|date:"Y-b-d H:i":"UTC"}}</time>
				<div class="keywords">
					{% with id.o.subject as tags %}
						{% if tags %}
							<p class="keywords">
								{_ Keywords _}:
								{% for id in tags %}
								<a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }}</a>
								{% endfor %}
							</p>
						{% endif %}
					{% endwith %}
				</div>
				<div class="social-icon">
					<a href="https://www.facebook.com/sharer/sharer.php?u={{m.rsc[id].page_url_abs}}"
						class="social"
						data-social="facebook"
						data-url="{{m.rsc[id].page_url_abs}}"
						<i class="fa fa-facebook-square fa-2x"></i>
					</a>
					<a href="http://twitter.com/share?url={{m.rsc[id].page_url_abs}}&text={{ id|summary:80 }}"
						class="social"
						data-social="twitter"
						data-url="{{m.rsc[id].page_url_abs}}"
						data-text="{{ id|summary:80 }}">
						<i class="fa fa-twitter-square fa-2x"></i>
					</a>
					<a href="https://plus.google.com/share?url={{m.rsc[id].page_url_abs}}"
						class="social"
						data-social="googleplus"
						data-url="{{m.rsc[id].page_url_abs}}">
						<i class="fa fa-google-plus-square fa-2x"></i>
					</a>
				</div>
				{% include "_edit_button.tpl" %}

			</div>
			<div class="featured-image">

			</div>

			<div class="entry-content">
				{{ m.rsc[id].body|show_media }}
			</div>

			<div class="entry-comment">
				{% include "_comments.tpl" id=id %}
			</div>

		</article>
	</div>
{% endblock %}