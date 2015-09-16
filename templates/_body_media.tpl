{% ifequal align "block" %}
	{% if m.rsc[id].medium.mime == "text/html-oembed" %}
		<section class="oembed-wrapper">
			{% media m.rsc[id].medium %}
		</section>
	{% elseif m.rsc[id].medium.mime == "audio/mpeg" or m.rsc[id].medium.mime == "audio/ogg" %}
		<section>
			{% if m.rsc[id].title %}
				<p>{{ m.rsc[id].short_title }}</p>
			{% endif %}
			<audio controls>
				<source src="{% url media_attachment id=id %}" type="audio/mpeg">
			{_ Your browser does not support the audio element. _}
			</audio>
		</section>
	{% else %}
		<figure class="image-wrapper block-level-image">
			{% media m.rsc[id].medium width=auto height=auto class=align link=link alt=m.rsc[id].title %}
			{% with id|summary as summary %}{% if summary %}<p class="image-caption">{{ summary }}</p>{% endif %}{% endwith %}
		</figure>
	{% endif %}
{% else %}
	{% media m.rsc[id].medium width=size.width|default:width height=size.height|default:height crop=crop class=align link=link alt=m.rsc[id].title %}
{% endifequal %}
