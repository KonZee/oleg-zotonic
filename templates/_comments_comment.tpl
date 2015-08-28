<li {% ifequal comment.user_id creator_id %}class="comment-author"{% endifequal %} {% if hidden %}style="display: none"{% endif %} id="comment-{{ comment.id }}">
	<article class="comment">
		<header class="comment-meta comment-author vcard">
			{% include "_comment_avatar.tpl" size=75 %}
			<cite class="fn"><a name="#comment-{{ comment.id }}">{{ comment.name|default:m.rsc[comment.user_id].title }}</a></cite>
			<a name="#comment-{{ comment.id }}><time datetime="{{ comment.created|timesince }}">{{ comment.created|timesince }}</time></a>
		</header>
		<section class="comment-content comment">
			{{ comment.message }}
		</section>
	</article>
</li>
