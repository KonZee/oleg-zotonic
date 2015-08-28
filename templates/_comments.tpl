{% with m.comment.rsc[id] as comments %}
{% if comments %}

<div id="comments" class="comments-area">

<h2 class="comments-title">{{comments|length}} {_ Comments _} <span class="on">→</span> <span>{{m.rsc[id].title}}</span></h2>
{% with m.rsc[id].creator_id as creator_id %}
<ol  id="comments-list" class="comments-list commentlist">
{% for comment in comments %}
   {% if comment.is_visible %}
      {% include "_comments_comment.tpl" %}
   {% endif %}
{% endfor %}
</ol>
{% endwith %}
</div>

{% endif %}
{% endwith %}

{% include "_comments_form.tpl" %}
